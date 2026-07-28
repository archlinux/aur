# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=voice-agent-git
pkgver=r125.69dd778
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
	# keep a per-user WRITABLE copy of the source and run there. The launcher provisions that copy's
	# .venv on first run via the tree's own bootstrap.sh --sync-only (run.sh is a pure runner and never
	# syncs), so all provisioning logic stays in the self-updating tree, not baked into this heredoc.
	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/voice-agent" <<'LAUNCH'
#!/usr/bin/env bash
# voice-agent launcher (AUR voice-agent-git).
#   voice-agent [gab|debug|local] [args]   run (brain per arg or .env)
#   voice-agent --update                   re-sync code after a package upgrade (keeps your data)
# First run / --update mirrors the pacman-managed /usr/share/voice-agent into a per-user working copy,
# preserving user data (.env, wakewords/, logs/, models/, data/, .venv), then provisions the venv via the
# tree's bootstrap.sh --sync-only (pinned Python >=3.12,<3.14 → 3.13 + ML deps; multi-GB, needs network the
# first time). Steady-state launches skip provisioning (fast-stat of .venv/.va-provisioned) and start instantly.
set -euo pipefail
SRC=/usr/share/voice-agent
WORKDIR="${VOICE_AGENT_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/voice-agent}"

NEED_PROVISION=0
if [[ "${1:-}" == "--update" || ! -e "$WORKDIR/main.py" ]]; then
	[[ "${1:-}" == "--update" ]] && shift || true
	mkdir -p "$WORKDIR"
	rsync -a --delete \
		--exclude='.env' --exclude='/wakewords/' --exclude='/logs/' \
		--exclude='/models/' --exclude='/data/' --exclude='/.venv/' --exclude='/wake-train/' \
		"$SRC"/ "$WORKDIR"/
	[[ -e "$WORKDIR/.env" || ! -e "$SRC/.env.example" ]] || cp "$SRC/.env.example" "$WORKDIR/.env"
	NEED_PROVISION=1
	printf 'voice-agent: working copy ready at %s\n' "$WORKDIR" >&2
	printf '  → set ANTHROPIC_API_KEY in %s/.env (first run installs deps + models — may take a minute)\n' "$WORKDIR" >&2
fi

cd "$WORKDIR"
# run.sh is a pure runner (uv run --no-sync) and never provisions the venv itself. Build/refresh it here on
# first run, after a package upgrade (--update), or if a prior run left it unpopulated — `uv run --no-sync`
# CREATES an empty .venv, so directory existence is NOT proof of provisioning. bootstrap.sh --sync-only owns
# the sync (with the satellite role's mdns extra) and marks .venv/.va-provisioned on a probe-verified
# success, so steady-state launches fast-stat the marker and skip straight to run.sh.
if [[ "$NEED_PROVISION" == 1 || ! -e .venv/.va-provisioned ]]; then
	./bootstrap.sh --yes --sync-only
fi
exec ./run.sh "$@"
LAUNCH
	chmod 755 "$pkgdir/usr/bin/voice-agent"
}
