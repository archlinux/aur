# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: OpenXplorer contributors <openxplorer@users.noreply.github.com>

_gitauthor=AKolenda
_gitname=openxplorer
_appid=io.winspace.Development
_appname=OpenXplorer
pkgname=${_gitname}
pkgdesc="Windows File Explorer-inspired file manager for Linux"

pkgver=2.0.17
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://openxplorer.app/"

license=('AGPL-3.0-only')

provides=('openxplorer' 'winspace')

makedepends=('cargo' 'python')
depends=('glibc' 'libgcc' 'graphene' 'gst-plugins-base-libs' 'gtk4' 'glib2' 'gdk-pixbuf2' 'libsoup3' 'pango' 'gstreamer' 'sqlite' 'hicolor-icon-theme')
optdepends=('polkit: deleting a whole folder as administrator under admin://'
            'gst-plugins-base: reading videos and audio files for the Details tab'
            'gst-plugins-good: reading MP4, MP3 and other common media for the Details tab'
            'gvfs: the Recycle Bin and the drive and phone list'
            'gvfs-smb: SMB shares'
            'gvfs-mtp: phones'
            'gnome-keyring: remembering SMB passwords'
            'xdg-utils: making OpenXplorer the default file manager'
            'file-roller: Open in archive manager'
            'xdg-desktop-portal-gtk: Share on GNOME (its Email portal)'
            'cifs-utils: the persistent SMB mount helper, openxplorer-mount-share')

options=('!debug' '!strip')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('5b27598a0f288a1b9d6cad53397a6b1ed392dde30436b50f55abb168988a99f6')


prepare() {
	cd "${pkgname}-${pkgver}/"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')" \
		--manifest-path native/Cargo.toml
}

build() {
	cd "${pkgname}-${pkgver}/"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export OX_APP_ID=${_appid}
	cargo build --frozen --release --manifest-path native/Cargo.toml \
		--package ox-app --bin openxplorer-native \
		--package ox-core --bin openxplorer-mount-share \
		--package ox-core --bin openxplorer-admin-delete
}

check() {
	cd "${pkgname}-${pkgver}/"

	desktop-file-validate "native/packaging/data/${_appid}.desktop"
	appstreamcli validate --no-net "native/packaging/data/${_appid}.metainfo.xml"
}

package() {
	cd "${pkgname}-${pkgver}/"

	# The shared install layout of every package format.
	python native/tools/package_data.py --app-id "${_appid}" --layout fhs \
		--program target/release/openxplorer-native \
		--mount-helper target/release/openxplorer-mount-share \
		--admin-delete target/release/openxplorer-admin-delete --destdir "${pkgdir}"

	rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
