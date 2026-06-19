# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=voice-agent-git
pkgver=r52.45e0790
pkgrel=1
pkgdesc="Real-time spoken assistant for Claude (Pipecat, local-first): mic→STT→brain→TTS with wake word, barge-in, and voice machine-control"
arch=('any')
url="https://github.com/indyfive11/voice-agent"
license=('MIT')
# uv provisions the pinned Python (>=3.12,<3.14) + the heavy ML deps into a per-user venv on first run,
# so the package itself ships only the source + launcher (arch-independent). portaudio (pyaudio) and
# espeak-ng (Kokoro phonemizer) are the system libs the venv links against.
depends=('uv' 'portaudio' 'espeak-ng' 'rsync')
optdepends=('pipewire: recommended audio backend — echo-cancel source enables wake-over-music'
            'ffmpeg: wake-word training tooling + audio capture'
            'ollama: run a local LLM brain (BRAIN=local)')
makedepends=('git')
provides=('voice-agent')
conflicts=('voice-agent')
source=("$pkgname::git+https://github.com/indyfive11/voice-agent.git")
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# Pacman-managed source tree (read-only canonical copy).
	install -d "$pkgdir/usr/share/voice-agent"
	cp -a "$srcdir/$pkgname/." "$pkgdir/usr/share/voice-agent/"
	rm -rf "$pkgdir/usr/share/voice-agent/.git" "$pkgdir/usr/share/voice-agent/.github"

	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Launcher: the app writes its config/logs/model/venv in its working dir and isn't XDG-aware, so we
	# keep a per-user WRITABLE copy of the source and run there. uv (per the repo's run.sh) provisions
	# the interpreter + deps into that copy's .venv on first run.
	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/voice-agent" <<'LAUNCH'
#!/usr/bin/env bash
# voice-agent launcher (AUR voice-agent-git).
#   voice-agent [gab|debug|local] [args]   run (brain per arg or .env)
#   voice-agent --update                   re-sync code after a package upgrade (keeps your data)
# First run / --update mirrors the pacman-managed /usr/share/voice-agent into a per-user working copy,
# preserving user data (.env, wakewords/, logs/, models/, data/, .venv). uv then provisions the pinned
# Python (>=3.12,<3.14 → 3.13) + ML deps on first run (multi-GB download; needs network the first time).
set -euo pipefail
SRC=/usr/share/voice-agent
WORKDIR="${VOICE_AGENT_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/voice-agent}"

if [[ "${1:-}" == "--update" || ! -e "$WORKDIR/main.py" ]]; then
	[[ "${1:-}" == "--update" ]] && shift || true
	mkdir -p "$WORKDIR"
	rsync -a --delete \
		--exclude='.env' --exclude='/wakewords/' --exclude='/logs/' \
		--exclude='/models/' --exclude='/data/' --exclude='/.venv/' --exclude='/wake-train/' \
		"$SRC"/ "$WORKDIR"/
	[[ -e "$WORKDIR/.env" || ! -e "$SRC/.env.example" ]] || cp "$SRC/.env.example" "$WORKDIR/.env"
	printf 'voice-agent: working copy ready at %s\n' "$WORKDIR" >&2
	printf '  → set ANTHROPIC_API_KEY in %s/.env (first run downloads deps + models)\n' "$WORKDIR" >&2
fi

cd "$WORKDIR"
exec ./run.sh "$@"
LAUNCH
	chmod 755 "$pkgdir/usr/bin/voice-agent"
}
