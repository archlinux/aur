# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: M0ustach3 <pablobondialuttiau@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=recon-ng
pkgver=5.1.2
pkgrel=2
pkgdesc='A full-featured Web Reconnaissance framework written in Python'
url="https://github.com/lanmaster53/recon-ng"
license=('GPL3')
arch=('any')
depends=('python' 'python-pyaml' 'python-dnspython' 'python-lxml' 'python-mechanize'
         'python-requests' 'python-flask' 'python-flask-restful' 'python-flasgger'
         'python-dicttoxml' 'python-xlsxwriter' 'python-unicodecsv' 'python-rq')
source=("https://github.com/lanmaster53/${pkgname}/archive/v${pkgver}/recon-ng-${pkgver}.tar.gz"
        opt-in-analytics.patch)
sha256sums=('18d05030b994c9b37f624628251d3376d590f3d1eec155f67aca88fa5f3490cc'
            '03ec8c0bb7437e7fd2a070b78b76a7dad5a9a0b4c13de0a427dbc0e395130594')

prepare() {
  cd "${pkgname}-${pkgver}"
  # change analytics from opt-out to opt-in
  patch -Np1 -i ../opt-in-analytics.patch
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -ra --no-preserve=owner . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  for bin in recon-ng recon-cli recon-web; do
    cat > "${pkgdir}/usr/bin/${bin}" << EOF
#!/bin/sh
cd /opt/recon-ng
exec python ${bin} "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${bin}"
  done

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
