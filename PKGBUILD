# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor: Edmund Lodewijks < e.lodewijks @ gmail.com >
# Contributor: éclairevoyant

pkgname=autorandr-git
pkgver=1.15.r6.ge459be7
pkgrel=2
pkgdesc="Auto-detect connected display hardware and load appropiate X11 setup using xrandr"
arch=(any)
url="https://github.com/phillipberndt/autorandr"
license=(GPL-3.0-only)
depends=(python xorg-xrandr python-regex)
makedepends=(desktop-file-utils git)
optdepends=(
  "pm-utils: For changing autorandr profile on thaw/resume"
  "xorg-xdpyinfo: For detecting the primary XRandR output"
  "bash-completion: auto-completion for autorandr in Bash"
  "zsh-completions: auto-completion for autorandr in ZSH"
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${pkgname%-git}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  # Bash completion
  install -vDm 644 "contrib/bash_completion/${pkgname%-git}" -t "$pkgdir/usr/share/bash-completion/completions/"
  # zsh completion - enable if needed
  #	install -vDm 644 contrib/zsh_completion/_$_pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  # fish completion - enable if needed
  #	install -vDm 644 contrib/fish_completion/$_pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  # docs
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}/"
  # Install man-page
  install -vDm 644 autorandr.1 -t "$pkgdir/usr/share/man/man1/"
}
