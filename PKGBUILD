# Maintainer: sfs <sfslinux@gmail.com>

_v=27070603f26b06661ed64ccbc27bfd2305596aff
_gitname=zzzfm-antix
#https://github.com/vanilla-dpup/woof-CE/tree/vanilladpup-12.0.x/rootfs-petbuilds/zzzfm
pkgname=zzzfm-dpup
pkgver=1.0.7
pkgrel=9
pkgdesc='Multi-panel tabbed file manager - wayland gtk3 version'
arch=(i686 x86_64)
url="https://gitlab.com/antiX-Linux/zzzfm-antix"
license=(GPL3+)
provides=('zzzfm')
conflicts=('zzzfm' 'zzzfm-bin' 'zzzfm-git')
depends=('e2fsprogs' 'gdk-pixbuf2' 'glibc' 'gtk-layer-shell' 'gtk3' 'hicolor-icon-theme' 'udev')
makedepends=(intltool git)
optdepends=('dbus: dbus integration'
            'util-linux: disk eject support'
            'lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user'
            'udevil: mount and unmount without password'
            'pmount: mount as non-root user'
            'curlftpfs: mount FTP shares'
            'jmtpfs: mount MTP devices'
            'gphotofs: mount cameras'
            'ifuse: mount your iPhone/iPod Touch'
            'fuseiso: mount ISO files'
            'particonsd: partition icons on the desktop'
            'bash-completion: programmable completion for the bash shell')

source=(
    "https://gitlab.com/antiX-Linux/zzzfm-antix/-/archive/$_v/${_gitname}-$_v.zip"
    'https://github.com/vanilla-dpup/woof-CE/raw/refs/heads/vanilladpup-12.0.x/rootfs-petbuilds/zzzfm/wayland.patch'
    'https://github.com/vanilla-dpup/woof-CE/raw/refs/heads/vanilladpup-12.0.x/rootfs-petbuilds/zzzfm/puppy-defaults.patch'
    'https://github.com/vanilla-dpup/woof-CE/raw/refs/heads/vanilladpup-12.0.x/rootfs-petbuilds/zzzfm/layer-shell.patch'
    'menu-popup-position.patch'
    'keyboard-on-demand.patch'
    "zzzfm-wallpaper.desktop"
    "zzzfm-desktop.desktop"
    )

sha256sums=(
    cc31bbf6f61ec834124cf2e120e8066a93f12868020570e1d1f1996521ee9b92  #zzzfm-antix-27070603f26b06661ed64ccbc27bfd2305596aff.zip
    29484b1acf9b2bebf5c45e748ef22865040595bc8075c188cf166d4bcef3483e  #wayland.patch
    4b90f2aa5c8e0632081ed510e7c7346e4ae5b23647cceed2daffba531cc6368a  #puppy-defaults.patch
    420c9b5e2027e2f638e3175e5336d16bbea8a182bc3e90c428d85666939f50a0  #layer-shell.patch
    e7a063d9915dead35cd2eb283d4195f6413efe66ca1a341cfa9c8bfef3e8a729  #menu-popup-position.patch
    3b5c9da61c05b2c696e121755a34db301dbb9b9f16f624f70ad60bfcb650688e  #keyboard-on-demand.patch
    bd424d9a595f4dba624c4c09c0da6e58bf273c6193e121b0f672ef6b24001cc8  #zzzfm-wallpaper.desktop
    cd52440c295a55f8916f1becf38a79c349d872a500ba6e491c3b850023e145f9  #zzzfm-desktop.desktop
    )

prepare() {
  cd "${srcdir}/${_gitname}-${_v}"
    patch -p1 < ../wayland.patch
#    patch -p1 < ../puppy-defaults.patch
    patch -p1 < ../layer-shell.patch #fix zzzfm --desktop
    patch -p1 < ../menu-popup-position.patch #menu at cursor on wayland
    patch -p1 < ../keyboard-on-demand.patch #keyboard focus on desktop under wayland
}

build() {
  cd "${srcdir}/${_gitname}-${_v}"
  CONFIG_SHELL=/bin/bash ./autogen.sh --prefix=/usr --disable-video-thumbnails --with-gtk3 --with-layer-shell
  make
}

package() {
  cd "${srcdir}/${_gitname}-${_v}"
  make DESTDIR="${pkgdir}" install
  sed -e 's/^Categories=.*/Categories=FileManager/' -i "$pkgdir/usr/share/applications/zzzfm.desktop"
  install -Dm644 ../zzzfm-wallpaper.desktop "$pkgdir/usr/share/applications/zzzfm-wallpaper.desktop"
  install -Dm644 ../zzzfm-desktop.desktop "$pkgdir/etc/xdg/autostart/zzzfm-desktop.desktop"
}