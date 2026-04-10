pkgname=oh-my-pi-git
pkgver=v13.10.1.r5817130cd3
pkgrel=1
pkgdesc="AI Coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more (git build)"
arch=('x86_64' 'aarch64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
provides=('omp')
conflicts=('omp')
depends=('glibc' 'gcc-libs' 'bun')
makedepends=('git' 'rust' 'rustup' 'cmake' 'make')
options=('!lto' '!strip')

source=("git+https://github.com/can1357/oh-my-pi.git")
sha256sums=('SKIP')

pkgver() {
  cd "oh-my-pi"
  git describe --tags --long --abbrev=7 | sed 's/\([^--]*\)-g/r\1/;s/-/./g'
}

prepare() {
  cd "oh-my-pi"
  git submodule update --init --recursive
}

build() {
  cd "oh-my-pi"
  bun install
  rustup install nightly
  rustup default nightly
  bun run build:native
  cd packages/coding-agent
  bun run build
  sha1sum dist/omp
  pwd
}

package() {
  pwd
  sha1sum "${srcdir}/oh-my-pi/packages/coding-agent/dist/omp"
  install -Dm755 "${srcdir}/oh-my-pi/packages/coding-agent/dist/omp" "${pkgdir}/usr/bin/omp"
  sha1sum "${pkgdir}/usr/bin/omp"
#  for _f in "oh-my-pi/src/oh-my-pi/packages/natives/native/pi_natives"*.node; do
#    [[ -f "$_f" ]] && install -Dm755 "$_f" "${pkgdir}/usr/bin/$(basename "$_f")"
#  done
}
