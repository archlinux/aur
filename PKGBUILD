# Maintainer: whiteman808 <whiteman808@paraboletancza.org>
# Contributor: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: M0ustach3 <pablobondialuttiau@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=recon-ng-git
_pkgname=recon-ng
pkgver=r1028.c08acee
pkgrel=1
pkgdesc='A full-featured Web Reconnaissance framework written in Python'
url="https://github.com/lanmaster53/recon-ng"
license=('GPL3')
arch=('any')
depends=('python' 'python-pyaml' 'python-dnspython' 'python-lxml' 'python-mechanize'
         'python-requests' 'python-flask' 'python-flask-restful' 'python-flasgger'
         'python-dicttoxml' 'python-xlsxwriter' 'python-unicodecsv' 'python-rq')
makedepends=('git')
source=("$pkgname::git+https://github.com/lanmaster53/recon-ng.git"
        opt-in-analytics.patch)
sha256sums=('SKIP'
            '03ec8c0bb7437e7fd2a070b78b76a7dad5a9a0b4c13de0a427dbc0e395130594')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  # change analytics from opt-out to opt-in
  patch -Np1 -i ../opt-in-analytics.patch
}

package() {
  cd "$srcdir/$pkgname"

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -ra --no-preserve=owner . "${pkgdir}/opt/${_pkgname}"

  install -d "${pkgdir}/usr/bin"
  for bin in recon-ng recon-cli recon-web; do
    cat > "${pkgdir}/usr/bin/${bin}" << EOF
#!/bin/sh
cd /opt/recon-ng
exec python ${bin} "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${bin}"
  done

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
