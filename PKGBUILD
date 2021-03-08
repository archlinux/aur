# Maintainer: gtaforever00 <63323218+gtaforever00@users.noreply.github.com>
# Maintainer: trippsc2 <46848743+trippsc2@users.noreply.github.com>
pkgname=alttpr-opentracker-git
_pkgname=alttpr-opentracker
_reponame=OpenTracker
pkgver=1.8.2.r1.67c9cc3
pkgrel=1
pkgdesc="An open-source cross-platform tracking app for A Link to the Past Randomizer."
arch=('x86_64')
url="https://github.com/trippsc2/OpenTracker"
license=('MIT')
options=("staticlibs")
depends=()
makedepends=('dotnet-sdk>=3.1' 'git' 'gendesk')
optdepends=('qusb2snes-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/trippsc2/OpenTracker")
sha256sums=('SKIP')

# Gendesk variables
_name="OpenTracker"
_genericname='Game Item Tracker'
_categories='Game;Utility;'
_exec='/usr/bin/alttpr-opentracker'

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'	
}

prepare() {
	gendesk -n -f --pkgname "$pkgname" \
	  --pkgdesc "$pkgdesc" \
	  --name "$_name" \
	  --genericname "$_genericname" \
	  --comment "$pkgdesc" \
	  --exec "$_exec" \
	  --categories "$_categories" \
	  --icon "$_pkgname"
}

build() {
	cd "$pkgname"
	dotnet publish \
	  --runtime linux-x64 \
	  --configuration Release \
	  --self-contained true \
	  -p:UseAppHost=true \
	  --output "../build"
}

package() {
	cd "$srcdir/build"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r * "${pkgdir}/opt/${pkgname}/"

	# Install staticlibs
	find . -name "*.a" | while read file; do
	  install -D -m644 "${file}" "${pkgdir}/opt/${pkgname}/${file}"
	done

	# Install license
	install -D -m644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

	# Install Desktop entry
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname/$_reponame/Assets/Images/triforce.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	# Symlink the binary
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname}/OpenTracker" "${pkgdir}/usr/bin/alttpr-opentracker"
}
