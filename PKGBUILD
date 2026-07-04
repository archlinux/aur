# Maintainer: Kaj Kowalski <info@kajkowalski.nl>

# Prebuilt package: installs the release binaries straight from the GitHub
# release `.tar.gz` assets (no compile). `pkgver`/`sha256sums_*` are rewritten
# by CI (.github/workflows/aur-release.yml) on every release; the values below
# are only a checked-in reference snapshot.
pkgname=runner-run-bin
pkgver=0.18.0
pkgrel=1
pkgdesc='Universal project task runner (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kjanat/runner'
license=('MIT')
# Prebuilt binaries are dynamically linked against glibc + libgcc_s.
depends=('glibc' 'gcc-libs')
provides=('runner-run')
conflicts=('runner-run')

# Per-arch release tarballs. Basenames already carry the Rust triple, so
# each arch downloads to a distinct file — no `name::` rename needed (and
# none with a literal arch that namcap would flag).
_url="https://github.com/kjanat/runner/releases/download/v$pkgver/runner-v$pkgver"
# Arch-independent man pages (one archive for all arches).
source=("$_url-man.tar.gz")
source_x86_64=("$_url-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_url-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$_url-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('d04d0ed3b88dfa3f947f22e54f731c057161d3be8951ff78cde8617adf4e9244')
sha256sums_x86_64=('52d74a8076f093f7d38d2b8c2dc024c2892ba9cbcb2c607636abac5549ec7baf')
sha256sums_aarch64=('f48813404ab3f9b938f335a121f2fcc648838c9746b17f70d15755e5c8d1d53c')
sha256sums_armv7h=('f0e450cf74ab3dad326da05e47212169064b9ac9d1ccd6a546074ee868d4e641')

package() {
	# Archives are flat: runner, run, README.md, LICENSE at the root.
	install -Dm0755 -t "$pkgdir/usr/bin/" runner run
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	# Shell completions. `runner completions <shell>` is the only generator
	# (a `run completions` subcommand does not exist) and emits a single
	# stream covering BOTH `runner` and `run` with the path of the invoking
	# `runner` binary baked in via `current_exe()`. Strategy:
	#   1. Generate the combined stream for each shell.
	#   2. sed-rewrite the baked $srcdir paths to /usr/bin/{runner,run}.
	#      Longer match first — `$srcdir/run` is a prefix of `$srcdir/runner`.
	#   3. awk-split bash + zsh on their start-of-line boundaries so each
	#      command gets its own autoload file. Fish stays as one file.
	local g="$srcdir/_compl"
	mkdir -p "$g"
	./runner completions bash >"$g/bash.combined"
	./runner completions zsh  >"$g/zsh.combined"
	./runner completions fish >"$g/fish.combined"
	./runner completions pwsh >"$g/runner.ps1"
	sed -i -e "s|$srcdir/runner|/usr/bin/runner|g" \
		-e "s|$srcdir/run|/usr/bin/run|g" \
		"$g/bash.combined" "$g/zsh.combined" "$g/fish.combined" "$g/runner.ps1"
	awk -v r="$g/runner.bash" -v n="$g/run.bash" \
		'/^_clap_complete_run\(\) \{$/ {o=n} {print > (o?o:r)}' "$g/bash.combined"
	awk -v r="$g/_runner" -v n="$g/_run" \
		'/^#compdef run$/ {o=n} {print > (o?o:r)}' "$g/zsh.combined"
	install -Dm0644 "$g/runner.bash" "$pkgdir/usr/share/bash-completion/completions/runner"
	install -Dm0644 "$g/run.bash"    "$pkgdir/usr/share/bash-completion/completions/run"
	install -Dm0644 "$g/_runner"     "$pkgdir/usr/share/zsh/site-functions/_runner"
	install -Dm0644 "$g/_run"        "$pkgdir/usr/share/zsh/site-functions/_run"
	# Fish autoloads completion files by command basename — `runner.fish` is
	# sourced on `runner<TAB>` but never on `run<TAB>`. Install the (identical)
	# combined stream under both names so each command's first tab works in
	# a fresh shell, without depending on session order.
	install -Dm0644 "$g/fish.combined" "$pkgdir/usr/share/fish/vendor_completions.d/runner.fish"
	install -Dm0644 "$g/fish.combined" "$pkgdir/usr/share/fish/vendor_completions.d/run.fish"
	# PowerShell has no system autoload dir on Linux — pwsh users dot-source
	# this file from their `$PROFILE`:  . /usr/share/runner/runner.ps1
	install -Dm0644 "$g/runner.ps1" "$pkgdir/usr/share/runner/runner.ps1"

	# Man pages from the -man.tar.gz source (flat *.1 in $srcdir). zipman gzips.
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "$srcdir"/*.1
}
