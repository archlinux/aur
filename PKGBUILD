# Maintainer: Yuri Pieters <magejohnyjtp at gmail dot com>

pkgname=spotify-adkiller-dns-block-git
pkgver=r82.1184e1e
pkgrel=4
pkgdesc='Experimental dns blocking from Spotify AdKiller'
arch=('i686' 'x86_64')
url=https://github.com/SecUpwN/Spotify-AdKiller
license=('GPL3')
depends=('spotify')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git#branch=dns-block" 
        "${pkgname%-git}"
	"${pkgname%-git}.desktop")
sha512sums=('SKIP'
            'da8d84b492ec11e97bd24bee38c3483e5da065fa1b936c8b37fa8bf1c756c16f282a4ac5c2ec667684b31c08ea14d451e38fab64d012cd565ed2b137b699264b'
            '3a38a5634ef8fb82212f44b021b614bbad2682129ec21a5e90fd00fc60f66da025cb61a3960d7b16b12e7d54773bb3cc4f9c14b867febabb3e2cd232a7455686')
pkgver() {
  cd "${url##*/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${url##*/}"
}

build() {
  cd "${url##*/}"/experimental
  make
}

package() {
  install -D "${url##*/}"/experimental/dns-block.so -t "$pkgdir"/usr/lib/"${pkgname%-git}"/

  install -D "${pkgname%-git}" -t "$pkgdir"/usr/bin/

  install -D -m644 "${pkgname%-git}.desktop" -t "$pkgdir"/usr/share/applications/

  install -d -m755 "${pkgdir}/usr/share/spotify/"
  ln -s '/opt/spotify/spotify' "${pkgdir}/usr/share/spotify/spotify"
}
