# Maintainer: Jonathan Wright <jon@than.io>
pkgname=journey-git
pkgver=0.1.9.r63.g9ab2c58
pkgrel=1
pkgdesc='Ghost-compatible blogging platform written in golang'
url='https://kabukky.github.io/journey/'

arch=('i686' 'x86_64')
makedepends=('go')
conflicts=('journey' 'journey-bin')
provides=("${pkgname%-git}")
license=('MIT')

options=('emptydirs')
backup=('opt/journey/config.json')
install='journey.install'

_srcpath='src/github.com/kabukky/journey'
_promenade_sha='59388206534e37aeabdbf672ea1a8e1cf93ee09f'

source=("${pkgname}::git+https://github.com/kabukky/journey/#branch=development"
        "promenade.zip::https://github.com/kabukky/promenade/archive/${_promenade_sha}.zip"
        'journey.service'
        'journey.install')
sha256sums=('SKIP'
            '2597207a112f69ec0de94bef063681a6d2f3920fff02c2117e5ccf392a4a1ca4'
            '71ff0fd4afd25bcc9e91fe2f9d9f9b8dd89884081e05c93bbd5f3c4c84b71428'
            '20b809dbe7553acbd940c6bd0a83b6b529d3ebc8fa5c4ac20ae74c1bb7c6b22c')

pkgver () {
	cd "${pkgname}"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	if [[ ! -r ${srcdir}/${_srcpath} ]] ; then
		mkdir -p ${srcdir}/$(dirname ${_srcpath})
		ln -s ${srcdir}/${pkgname} ${srcdir}/${_srcpath}
	fi
}

build () {
	export GOPATH="${srcdir}"
  export GO111MODULE="auto"
	cd ${srcdir}/${_srcpath}
  msg2 "Generating..."
	go generate ./...
  msg2 "Fetching..."
  go get -v ./...
  msg2 "Building..."
	go build -v -o ${srcdir}/${pkgname}/journey
  msg2 "Extracting Promenade..."
  unzip -qu ${srcdir}/promenade.zip -d ${srcdir}
  cp -ar ${srcdir}/promenade-${_promenade_sha}/* ${srcdir}/${pkgname}/content/themes/promenade/
}

package() {
  cd ${srcdir}/${pkgname}

  # Binary, configuration, and service Unit file
  install -Dm755 journey ${pkgdir}/opt/journey/journey
  install -Dm644 config.json ${pkgdir}/opt/journey/config.json
  install -Dm644 ${srcdir}/journey.service ${pkgdir}/usr/lib/systemd/system/journey.service
  # License
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  # Private files for journey's Admin area and the persistant data for the blog
  cp -ar built-in ${pkgdir}/opt/journey/
  cp -ar content ${pkgdir}/opt/journey/
  # Make sure there is absolutly no way the SQLite database can ever make it
  # into the package and overwrite the local copy during upgrade
  rm -f ${pkgdir}/opt/journey/content/data/journey.db
}
