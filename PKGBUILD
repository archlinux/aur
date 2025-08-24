# Maintainer: Network_Jack <Network_Jack@null.net>
pkgname=dumpsterdiver-git
_pkgname=${pkgname%-git}
pkgver=r108.a54c190
pkgrel=1
pkgdesc="DumpsterDiver is a tool used to analyze big volumes of various file types in search of hardcoded secret keys"
arch=('any')
url="https://github.com/securing/DumpsterDiver"
license=('MIT')
depends=('python' 'python-termcolor' 'python-pyaml' 'python-passwordmeter')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=()
install=
source=("${_pkgname}::git+https://github.com/securing/DumpsterDiver.git"
	'core.py.patch'
	'advancedSearch.py.patch')
sha256sums=('SKIP'
            '515717412d2e35c895b7f5eab2247b3345f33cd4ceff1859908cdd6d976f63a6'
            'e85786eb49a43bc8ea87d924f66476fcee4aa64b483d60227bb81c4bf427cc94')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  # read config file from /etc/dumpsterdiver
  patch -p1 -i "core.py.patch" "${_pkgname}/core.py"
  # read rules file from /etc/dumpsterdiver
  patch -p1 -i "advancedSearch.py.patch" "${_pkgname}/advancedSearch.py"
}

package() {
  cd "${srcdir}/${_pkgname}"
  #make DESTDIR="$pkgdir/" install
  # Install config file
  install -Dm644 config.yaml "${pkgdir}/etc/dumpsterdiver/config.yaml"
  install -Dm644 rules.yaml "${pkgdir}/etc/dumpsterdiver/rules.yaml"

  # Now the main program
  install -Dm755 core.py "${pkgdir}/usr/share/dumpsterdiver/core.py"
  install -Dm755 advancedSearch.py "${pkgdir}/usr/share/dumpsterdiver/advancedSearch.py"
  install -Dm755 DumpsterDiver.py "${pkgdir}/usr/share/dumpsterdiver/DumpsterDiver.py"

  # Misc Stuff
  install -Dm644 README.md "${pkgdir}/usr/share/dumpsterdiver/README.md"
  install -Dm644 requirements.txt "${pkgdir}/usr/share/dumpsterdiver/requirements.txt"

  # Shell Shim
  mkdir -p "${pkgdir}/usr/bin/"
  echo "/usr/share/dumpsterdiver/DumpsterDiver.py \${@}" > "${pkgdir}/usr/bin/dumpsterdiver"
  chmod 755 "${pkgdir}/usr/bin/dumpsterdiver"
}

