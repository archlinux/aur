# Maintainer:
# Contributor: Robin Broda <robin at broda dot me>
# Contributor: Uffe Jakobsen <uffe@uffe.org>

pkgname=daemontools-encore
pkgver=1.11
pkgrel=1
pkgdesc="collection of tools for managing UNIX services - derived from the public-domain release of daemontools by D. J. Bernstein."
arch=('i686' 'x86_64')
url="https://untroubled.org/daemontools-encore"
license=('MIT')
depends=('glibc' 'sh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bruceg/daemontools-encore/archive/$pkgver.tar.gz"
        'ldflags.patch'
        'cflags.patch')
sha256sums=('57fab05da8129b6d13c586662321d5795935d2ef16c30763e31a933afa74f362'
            '3842bbef9690295e77faab723205361667415f9788de6e09150f02e6a006c423'
            '525b9392c517e31e844d72b1b478b72e6e410009eb2f521b53900a15aeead25e')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch conf-cc "${srcdir}/cflags.patch"
  patch conf-ld "${srcdir}/ldflags.patch"

  sed -i 's/fgrep/grep -F/' makemake
  touch TARGETS
  ./makemake
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  path_bin="${pkgdir}/usr/bin"
  path_man="${pkgdir}/usr/share/man"

  install -dm755 "${path_bin}"
  install -dm755 "${path_man}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  echo "${path_bin}" > conf-bin
  echo "${path_man}" > conf-man

  make install
}
