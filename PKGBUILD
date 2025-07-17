# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tranalyzer
pkgver=0.9.3
_pkgver=lmw1
pkgrel=1
pkgdesc='Lightweight flow generator and packet analyzer'
arch=('x86_64' 'aarch64')
url='https://tranalyzer.com'
license=('GPL3')
depends=('libpcap'
         'mongo-c-driver'
         'postgresql-libs'
         'mariadb-libs'
         'sqlite'
         'libbsd'
         'pcre'
         'gawk')
optdepends=('graphviz: Required by some plugins'
            'gnuplot: Required by gpq3x, plot_monitoring'
            'p0f: Required by osStat'
            'rrdtool: Required by rrdmonitor, rrdplot'
            'inotify-tools: Required by t2dmon')
makedepends=('mongo-c-driver'
             'libtool'
             'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://tranalyzer.com/download/tranalyzer/tranalyzer2-${pkgver}${_pkgver}.tar.gz")
b2sums=('af51a2699896fadb93515c31faa6c4474647328faee621dd240ecf1b37ccfaaeb1c991f7b32f8416aa6f6a3c252fa7407805d52f8359873b9f8708f495c92294')

prepare() {
  cd "${pkgname}2-${pkgver}"
  sed -i "29s|\.tranalyzer/plugins/|/usr/lib/tranalyzer/plugins|" tranalyzer2/src/tranalyzer.h
  sed -i "43s|.*|T2FMDIR=/usr/share/tranalyzer/scripts/t2fm|" scripts/t2fm/t2fm
  sed -i "7s|\$(dirname \"$\0\")|/usr/share/tranalyzer/scripts/tawk|" scripts/tawk/tawk 

  for script in b64ex fpsGplt gpq3x osStat plot_monitoring protStat statGplt t2alive t2caplist t2dmon t2flowstat t2plot t2stat t2timeline t2viz topNStat; do
    sed -i "s|\$(dirname \"$\0\")|/usr/share/tranalyzer/scripts|" scripts/${script} || true
  done
}

build() {
  cd "${pkgname}2-${pkgver}"
  echo y | ./autogen.sh -a -p "${srcdir}/${pkgname}2-${pkgver}/build/plugins"
  gzip --force tranalyzer2/man/tranalyzer.1
  gzip --force scripts/t2conf/man/t2conf.1
  gzip --force scripts/t2fm/man/t2fm.1
  gzip --force scripts/tawk/man/t2nfdump.1
  gzip --force scripts/tawk/man/tawk.1
}

package() {
  cd "${pkgname}2-${pkgver}"
  install -d "${pkgdir}/usr/lib/${pkgname}/"
  cp -avR build/plugins "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 tranalyzer2/src/tranalyzer -t "${pkgdir}/usr/bin"
  install -Dm755 utils/t2b2t/t2b2t -t "${pkgdir}/usr/bin"
  install -Dm755 utils/t2whois/t2whois -t "${pkgdir}/usr/bin"

  install -Dm644 doc/tutorials/splunk.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 doc/tutorials/custom_plugin.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 doc/documentation.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 scripts/doc/scripts.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 scripts/tawk/doc/tawk.pdf -t "${pkgdir}/usr/share/doc/${pkgname}/tawk"
  install -Dm644 scripts/t2fm/doc/t2fm.pdf -t "${pkgdir}/usr/share/doc/${pkgname}/t2fm"

  install -d "${pkgdir}/usr/share/doc/${pkgname}/plugins"
  for doc in $(ls plugins/*/doc/*.pdf | xargs); do
    install -Dm644 ${doc} -t "${pkgdir}/usr/share/doc/${pkgname}/plugins"
  done

  install -Dm644 tranalyzer2/man/tranalyzer.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 scripts/t2conf/man/t2conf.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 scripts/t2fm/man/t2fm.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 scripts/tawk/man/t2nfdump.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 scripts/tawk/man/tawk.1.gz -t "${pkgdir}/usr/share/man/man1"

  rm -rf scripts/tawk/man scripts/t2fm/man scripts/t2conf/man

  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -avR scripts/ "${pkgdir}/usr/share/${pkgname}/"

  install -Dm644 scripts/completions/* -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 scripts/completions/* -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm644 scripts/t2_aliases -t "${pkgdir}/usr/share/bash-completion/completions/"

  for script in b64ex fpsGplt gpq3x osStat plot_monitoring protStat statGplt t2alive t2caplist t2dmon t2flowstat t2plot t2stat t2timeline t2viz topNStat; do
    ln -s /usr/share/tranalyzer/scripts/${script} "${pkgdir}/usr/bin/" || true
  done

  ln -s /usr/share/tranalyzer/scripts/tawk/tawk "${pkgdir}/usr/bin/"
  ln -s /usr/share/tranalyzer/scripts/t2fm/t2fm "${pkgdir}/usr/bin/"

  sed -i "641s|.*|T2HOME=/usr/share/tranalyzer|" "${pkgdir}/usr/share/${pkgname}/scripts/t2utils.sh"
  # sed -i '114,133d' "${pkgdir}/usr/share/${pkgname}/scripts/t2doc"
  # sed -i "88s|.*|folder=\"/usr/share/doc/tranalyzer/\$name/\"|" "${pkgdir}/usr/share/${pkgname}/scripts/t2doc"
  # sed -i "82s|.*|folder=\"/usr/share/doc/tranalyzer/\"|" "${pkgdir}/usr/share/${pkgname}/scripts/t2doc"
  # sed -i "79s|.*|folder=\"/usr/share/doc/tranalyzer/\"|" "${pkgdir}/usr/share/${pkgname}/scripts/t2doc"
  # sed -i "91s|.*|folder=\"/usr/share/doc/tranalyzer/plugins/\"|" "${pkgdir}/usr/share/${pkgname}/scripts/t2doc"
}
