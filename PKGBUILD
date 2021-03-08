# Maintainer: gtaforever00 <63323218+gtaforever00@users.noreply.github.com>
# Maintainer: trippsc2 <46848743+trippsc2@users.noreply.github.com>
pkgname=alttpr-opentracker
_reponame=OpenTracker
pkgver=1.8.2
pkgrel=1
pkgdesc='An open-source cross-platform tracking app for A Link to the Past Randomizer.'
arch=('x86_64')
url='https://github.com/trippsc2/OpenTracker'
license=('MIT')
options=('staticlibs')
depends=()
makedepends=('dotnet-sdk>=3.1' 'git' 'gendesk')
optdepends=('qusb2snes-git')
source=("${pkgname}::git+https://github.com/trippsc2/OpenTracker#tag=${pkgver}")
sha256sums=('SKIP')

# Gendesk variables
_name="OpenTracker"
_genericname='Game Item Tracker'
_categories='Game;Utility;'
_exec='/usr/bin/alttpr-opentracker'

prepare() {
	gendesk -n -f --pkgname "$pkgname" \
	  --pkgdesc "$pkgdesc" \
	  --name "$_name" \
	  --genericname "$_genericname" \
	  --comment "$pkgdesc" \
	  --exec "$_exec" \
	  --categories "$_categories" \
	  --icon "$pkgname"
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
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname/$_reponame/Assets/Images/triforce.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	# Symlink the binary
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname}/OpenTracker" "${pkgdir}/usr/bin/alttpr-opentracker"
}
