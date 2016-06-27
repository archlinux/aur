# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

_pkgname=atom
_version=beta

# Versions
_about_url="https://github.com/fusion809/about"
_about_arch_ver=1.6.1
_language_gfm2_ver=0.92.0
_language_liquid_ver=0.5.1

pkgname=${_pkgname}-editor-${_version}
_pkgrel=0
_pkgver=1.9.0
pkgver="${_pkgver}.${_pkgrel}.m${_language_gfm2_ver}"
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century, built using web technologies on the Electron framework - Beta channel.'
arch=('x86_64' 'i686')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-beta-bin' 'atom-editor-beta-arch')
install=atom.install
source=("$url/archive/v${_pkgver}-${_version}${_pkgrel}.tar.gz"
"about-arch-${_about_arch_ver}.tar.gz::$_about_url/archive/v${_about_arch_ver}.tar.gz"
"${_pkgname}-${_version}.desktop"
"${_pkgname}-${_version}"
"about-beta.patch")
sha256sums=('794ee5c9cc46e9568150db3cb6e2a0791a0cd4e9c243f29d65616adf5e15a210'
            '85b904a247078121ccfe14f1d18fa49facc8747a4ac731591dadc85fa3c1e093'
            'c62faaf2f50cddb1a834ccb33c95724076d2859c88baac7d9d676bc9c3afc8c6'
            '230563ed327833351d448e152ab8b146d2d2b7bdac42c7d39eef966b96b862fc'
            'f0af112075822a7163a5f9be7a096524fbdd4c39f1c56c6913b3f9f99aea0491')

prepare() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

  sed -i -e "/exception-reporting/d" \
	       -e "/metrics/d" \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",/g" \
         -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
         package.json

	chmod 755 -R package.json

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"

  if ! [[ -d node_modules ]]; then
    mkdir -p node_modules
  else
    rm -rf node_modules/about-arch
  fi

  mv $srcdir/about-${_about_arch_ver} $srcdir/about-arch
  mv $srcdir/about-arch node_modules
  cd node_modules/about-arch
  patch -Np1 -i $srcdir/about-beta.patch
  cd -

	sed -i -e "s/<%=Desc=%>/$pkgdesc/g" ${srcdir}/${_pkgname}-${_version}.desktop
}

build() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

	export PYTHON=/usr/bin/python2
	until ./script/build --build-dir "$srcdir/${_pkgname}-build"; do :; done
}

package() {
	cd "$srcdir/${_pkgname}-${_pkgver}-${_version}${_pkgrel}"

	script/grunt install --build-dir "$srcdir/${_pkgname}-build" --install-dir "$pkgdir/usr"

	if [[ -d "$pkgdir/usr/share/${_pkgname}" ]]; then
  	mv "$pkgdir/usr/share/${_pkgname}" "$pkgdir/usr/share/${_pkgname}-${_version}"
	fi

  if [[ -f "$pkgdir/usr/bin/${_pkgname}" ]]; then
		rm "$pkgdir/usr/bin/${_pkgname}"
  fi

	if [[ -f "$pkgdir/usr/bin/apm" ]]; then
		rm "$pkgdir/usr/bin/apm"
	fi

	ln -sf "${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app/apm/node_modules/.bin/apm" "${pkgdir}/usr/bin/apm-${_version}"

	if [[ -f "$pkgdir/usr/share/applications/${_pkgname}.desktop" ]]; then
  	rm "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	fi

  install -Dm755 $srcdir/${_pkgname}-${_version} "$pkgdir/usr/bin/${_pkgname}-${_version}"
	install -Dm644 $srcdir/${_pkgname}-${_version}.desktop "$pkgdir/usr/share/applications/${_pkgname}-${_version}.desktop"
	install -Dm644 resources/app-icons/${_version}/png/1024.png "$pkgdir/usr/share/pixmaps/${_pkgname}-${_version}.png"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
