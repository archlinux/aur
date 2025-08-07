# Maintainer: sfs <sfslinux@gmail.com>

_v=bc7473cebcf3b4f932d82d82c044c68b8c78de58
_gitname=zzzfm
#https://github.com/vanilla-dpup/woof-CE/tree/vanilladpup-11.0.x/woof-code/rootfs-petbuilds/zzzfm
pkgname=${_gitname}-dpup
pkgver=1.0.7
pkgrel=4
pkgdesc='Multi-panel tabbed file manager - wayland gtk3 version'
arch=(i686 x86_64)
url="https://gitlab.com/skidoo/zzzfm"
license=(GPL3+)
provides=('zzzfm')
conflicts=('zzzfm' 'zzzfm-bin' 'zzzfm-git')
#depends=('ffmpegthumbnailer' 'e2fsprogs' 'gdk-pixbuf2' 'glibc' 'gtk2>=2.24.32' 'hicolor-icon-theme' 'udev')
depends=('e2fsprogs' 'gdk-pixbuf2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'udev')
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
            'bash-completion: programmable completion for the bash shell')

source=(
    "https://gitlab.com/antix-contribs/zzzfm/-/archive/$_v.zip"
    'https://github.com/vanilla-dpup/woof-CE/raw/refs/heads/vanilladpup-11.0.x/woof-code/rootfs-petbuilds/zzzfm/fix-ftbfs-gcc14.patch'
    'https://github.com/vanilla-dpup/woof-CE/raw/refs/heads/vanilladpup-11.0.x/woof-code/rootfs-petbuilds/zzzfm/wayland.patch'
    'https://github.com/vanilla-dpup/woof-CE/raw/refs/heads/vanilladpup-11.0.x/woof-code/rootfs-petbuilds/zzzfm/layer-shell.patch'
    'https://github.com/vanilla-dpup/woof-CE/raw/refs/heads/vanilladpup-11.0.x/woof-code/rootfs-petbuilds/zzzfm/mount.patch'
    'https://github.com/vanilla-dpup/woof-CE/raw/refs/heads/vanilladpup-11.0.x/woof-code/rootfs-petbuilds/zzzfm/puppy-defaults.patch'
    "zzzfm-wallpaper.desktop"
    "zzzfm-desktop.desktop"
    )

sha256sums=(
    7755747f1bb12f68a26ea152bf9169879607e3eb839459d293fced365f9eb45b  #bc7473cebcf3b4f932d82d82c044c68b8c78de58.zip
    0a8deb59716dc294a1ef8c1b7408f1698d146261cd88681cc05c6fc17afb49ce  #fix-ftbfs-gcc14.patch
    29484b1acf9b2bebf5c45e748ef22865040595bc8075c188cf166d4bcef3483e  #wayland.patch
    6ab5d9997f29e16c0137fa62d5916a10f6418a444d54c86f1642129f655b9175  #layer-shell.patch
    d9abab450596e0f15550cb0541301a24f2f7f4d438c129c8998ff7cbb1a786f9  #mount.patch
    ee09bbccd0eeae91d4e20101369866d58d222e99f46a76dbe2ab9c977103c7dd  #puppy-defaults.patch
    bd424d9a595f4dba624c4c09c0da6e58bf273c6193e121b0f672ef6b24001cc8  #zzzfm-wallpaper.desktop
    cd52440c295a55f8916f1becf38a79c349d872a500ba6e491c3b850023e145f9  #zzfm-desktop.desktop
    )

prepare() {
  cd "${srcdir}/${_gitname}-${_v}"
    patch -p1 < ../fix-ftbfs-gcc14.patch
    patch -p1 < ../wayland.patch
#    patch -p1 < ../mount.patch
#    patch -p1 < ../puppy-defaults.patch
    patch -p1 < ../layer-shell.patch #fix zzzfm --desktop
}

build() {
  cd "${srcdir}/${_gitname}-${_v}"
  CONFIG_SHELL=/bin/bash ./autogen.sh --prefix=/usr --disable-video-thumbnails --with-gtk3  --with-layer-shell
  make
}

package() {
  cd "${srcdir}/${_gitname}-$_v"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../zzzfm-wallpaper.desktop "$pkgdir/usr/share/applications/zzzfm-wallpaper.desktop"
  install -Dm644 ../zzzfm-desktop.desktop "$pkgdir/etc/xdg/autostart//zzzfm-desktop.desktop"
}
