# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tranalyzer
pkgver=0.8.8
pkgrel=1
pkgdesc='Lightweight flow generator and packet analyzer'
arch=('i686' 'x86_64')
url='https://tranalyzer.com'
license=('GPL3')
depends=('libpcap'
         'mongo-c-driver'
         'postgresql-libs'
         'mariadb-libs'
         'sqlite'
         'pcre'
         'gawk')
optdepends=('graphviz: Required by some plugins')
makedepends=('mongo-c-driver'
             'libtool'
             'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://tranalyzer.com/download/tranalyzer/tranalyzer2-${pkgver}lmw4.tar.gz")
sha256sums=('55beaa92d6269a184aea9e2a8ecbda029cbba932ee1a3ab12807d1d76026cce9')

prepare() {
  cd "${pkgname}2-${pkgver}"
  sed -i "29s|\.tranalyzer/plugins/|/usr/lib/tranalyzer/plugins|" tranalyzer2/src/tranalyzer.h
  sed -i "43s|.*|T2FMDIR=/usr/share/tranalyzer/scripts/t2fm|" scripts/t2fm/t2fm
  sed -i "7s|\$(dirname \"$\0\")|/usr/share/tranalyzer/scripts/tawk|" scripts/tawk/tawk 
}

build() {
  cd "${pkgname}2-${pkgver}"
  echo y | ./autogen.sh -a -p "${srcdir}/${pkgname}2-${pkgver}/build/plugins"
}

package() {
  cd "${pkgname}2-${pkgver}"
  install -d "${pkgdir}/usr/lib/${pkgname}/"
  cp -avR build/plugins "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 tranalyzer2/src/tranalyzer -t "${pkgdir}/usr/bin"

  install -Dm644 doc/tutorials/splunk.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 doc/tutorials/custom_plugin.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 doc/documentation.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 scripts/doc/scripts.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 scripts/tawk/doc/tawk.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 scripts/t2fm/doc/t2fm.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"

  gzip --force tranalyzer2/man/tranalyzer.1
  install -Dm644 tranalyzer2/man/tranalyzer.1.gz -t "${pkgdir}/usr/share/man/man1"
  gzip --force scripts/t2conf/man/t2conf.1
  install -Dm644 scripts/t2conf/man/t2conf.1.gz -t "${pkgdir}/usr/share/man/man1"
  gzip --force scripts/t2fm/man/t2fm.1
  install -Dm644 scripts/t2fm/man/t2fm.1.gz -t "${pkgdir}/usr/share/man/man1"
  gzip --force scripts/tawk/man/t2nfdump.1
  install -Dm644 scripts/tawk/man/t2nfdump.1.gz -t "${pkgdir}/usr/share/man/man1"
  gzip --force scripts/tawk/man/tawk.1
  install -Dm644 scripts/tawk/man/tawk.1.gz -t "${pkgdir}/usr/share/man/man1"

  rm -rf scripts/tawk/man scripts/t2fm/man scripts/t2conf/man

  install -d "${pkgdir}/usr/share/${pkgname}" "${pkgdir}/usr/bin"
  cp -avR scripts/ "${pkgdir}/usr/share/${pkgname}/"

  install -Dm644 scripts/completions/* -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 scripts/completions/* -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm644 scripts/t2_aliases -t "${pkgdir}/usr/share/bash-completion/completions/"

  for script in b64ex fpsGplt gpq3x osStat plot_monitoring protStat rrdmonitor rrdplot statGplt t2alive t2caplist t2dmon t2doc t2flowstat t2plot t2stat t2timeline t2viz topNStat; do
    ln -s /usr/share/tranalyzer/scripts/${script} "${pkgdir}/usr/bin/"
  done

  ln -s /usr/share/tranalyzer/scripts/tawk/tawk "${pkgdir}/usr/bin/"
  ln -s /usr/share/tranalyzer/scripts/t2fm/t2fm "${pkgdir}/usr/bin/"
}
# vim:set ts=2 sw=2 et: