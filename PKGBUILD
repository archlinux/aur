# Maintainer: Robin Broda <robin at broda dot me>
# Contributor: Uffe Jakobsen <uffe@uffe.org>

pkgname=daemontools-encore
pkgver=1.10
pkgrel=3
pkgdesc="collection of tools for managing UNIX services - derived from the public-domain release of daemontools by D. J. Bernstein."
arch=('i686' 'x86_64')
url="https://untroubled.org/daemontools-encore"
license=('MIT')
depends=('sh')
source=("https://untroubled.org/daemontools-encore/${pkgname}-${pkgver}.tar.gz"
        'ldflags.patch'
        'cflags.patch')
sha256sums=('9f48f3c6cdd3f2b0202532e87f9ff46ea86777ca31ebda3a96bed618104bbd31'
            '3842bbef9690295e77faab723205361667415f9788de6e09150f02e6a006c423'
            'b61e21071c1f115d32dd36f58f826310981e17978f5542e15da071abaf6fe22a')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch conf-cc "${srcdir}/cflags.patch"
  patch conf-ld "${srcdir}/ldflags.patch"
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

  make DESTDIR="${pkgdir}/" install
}
