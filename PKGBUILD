# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

_pkgname=atom
_version=git

# Module Versions
_about_url="https://github.com/fusion809/about"
_about_arch_ver=1.6.2
_language_gfm2_ver=0.92.1
_language_liquid_ver=0.5.1

pkgname=${_pkgname}-editor-${_version}
pkgver=1.10.0.dev.m0.92.0.r1.98fc8db
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century, based on web technologies and built from the latest git source code'
arch=('x86_64' 'i686')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
install=${_pkgname}-${_version}.install
source=("git+${url}.git"
"about-arch-${_about_arch_ver}.tar.gz::$_about_url/archive/v${_about_arch_ver}.tar.gz"
"about-git.patch"
"${_pkgname}-${_version}.desktop"
"${_pkgname}-${_version}")
sha256sums=('SKIP'
            'b76bdecbf42456c66c029b4f9c75cb8acde389119e1e4a29de2980443703d752'
            '8fd5c1f23ec4110ab339d2c8c4305c6d0e9f11f7f6ddc80f3c45ca990691ac43'
            '8e7723a0618661f5dabc5729deaf0b453ef7945ec904690a95d446eb517ec522'
            '542c10ffb540bd91a441682867517a02a959a20625293f72f33fab71cd3602be')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed "s|v1.6.0-beta0|1.10.0.dev.m${_language_gfm2_ver}.r1.|g" | sed 's/-[0-9]*-//g' | sed 's/g//g'
}

prepare() {
	cd "$srcdir/${_pkgname}"

  # Remove exception-reporting/metrics (priv concerns)
  # Replace language-gfm with language-gfm2 and language-liquid (provides syntax-highlighting for Liquid/HTML in GFM docs)
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
  patch -Np1 < $srcdir/about-git.patch

  sed -i -e "s/<%=Desc=%>/$pkgdesc/g" ${srcdir}/${_pkgname}-${_version}.desktop
}

build() {
	cd "$srcdir/${_pkgname}"

	export PYTHON=/usr/bin/python2
	until ./script/build --build-dir "$srcdir/${_pkgname}-build"; do :; done
}

package() {
	cd "$srcdir/${_pkgname}"

	script/grunt install --build-dir "$srcdir/${_pkgname}-build" --install-dir "$pkgdir/usr"

  mv "$pkgdir/usr/share/${_pkgname}" "$pkgdir/usr/share/${_pkgname}-${_version}"

	rm "$pkgdir/usr/bin/${_pkgname}"

  install -Dm755 "$srcdir/${_pkgname}-${_version}" "$pkgdir/usr/bin/${_pkgname}-${_version}"

	rm "$pkgdir/usr/bin/apm"

	ln -sf "${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app/apm/node_modules/.bin/apm" "${pkgdir}/usr/bin/apm-${_version}"

	if [[ -f "$pkgdir/usr/share/applications/${_pkgname}.desktop" ]]; then
  	rm "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	fi

  install -Dm644 "$srcdir/${_pkgname}-${_version}.desktop" "$pkgdir/usr/share/applications/${_pkgname}-${_version}.desktop"
  install -Dm644 "resources/app-icons/dev/png/1024.png" "$pkgdir/usr/share/pixmaps/${_pkgname}-${_version}.png"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
