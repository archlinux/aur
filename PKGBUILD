# Maintainer: Josef Andersson <josefandersson@tuta.io>
#
# Builds the saur binary from source with bun and installs it. This is a VCS (-git) package;
# update `url`/`source` to the published repo before uploading to the AUR.

pkgname=saur-git
_binname=saur
pkgver=1.4.0
pkgrel=1
pkgdesc="A safer AUR helper with Claude security review baked in"
arch=('x86_64' 'aarch64')
url="https://git.josf.dev/josefandersson/saur"
license=('MIT')
depends=('claude-code')          # runtime: the `claude` CLI (authenticated)
makedepends=('bun' 'git')
provides=('saur')
conflicts=('saur')
# Do NOT strip: this is a bun standalone executable with the app bundle appended after the ELF.
# `strip` (which makepkg runs by default) corrupts that trailer, so the binary falls back to bun's
# own CLI — `saur update` then runs `bun update`. Keep the compiled binary intact.
options=('!strip')
source=("${_binname}::git+https://git.josf.dev/josefandersson/saur.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_binname"
	printf "%s.r%s.g%s" \
		"$(awk -F'\"' '/"version"/{print $4; exit}' package.json)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "$_binname"
	bun install --frozen-lockfile
	bun build src/main.ts --compile --outfile "$_binname"
}

check() {
	cd "$_binname"
	bun test
	# Guard: a corrupt/miscompiled standalone binary falls back to bun's OWN CLI, so saur's
	# `install`/`update` subcommands would run `bun install`/`bun update` (this shipped in the
	# v1.0.0 saur-bin). A good build answers `--version` with `saur <ver>`; anything else means
	# bun couldn't find the embedded app — fail the build rather than install a hijacked binary.
	./"$_binname" --version | grep -q '^saur ' || {
		echo "saur: compiled binary is hijacked by the bun runtime (embedded app not found);" >&2
		echo "      this build is corrupt. Try a different bun version and rebuild." >&2
		return 1
	}
}

package() {
	cd "$_binname"
	install -Dm755 "$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
