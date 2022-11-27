# Maintainer: Taijian <taijian@posteo.de>
# Contributors: Patrick Burroughs (Celti), Abbradar, Zephyr, Christian Autermann, Biginoz, Martin Lee, Ricardo Funke,
#               PirateJonno, lh, Cilyan Olowen, Shaffer, Brcha, Lyle Putnam, Det, Boohbah,
#               Lara Maia, Padfoot, Jorge Barroso, carstene1ns, Sebastian Lau

pkgname=plymouth-git
_pkgname=plymouth
pkgver=22.02.122.r117.gca15d30c
pkgrel=1
pkgdesc="A graphical boot splash screen with kernel mode-setting support (Development version)"
url="https://www.freedesktop.org/wiki/Software/Plymouth/"
arch=('i686' 'x86_64')
license=('GPL')

depends=('libdrm' 'systemd' 'pango' 'cantarell-fonts' 'ttf-dejavu' 'libevdev' 'libxkbcommon')
makedepends=('git' 'docbook-xsl' 'meson')
optdepends=('xf86-video-fbdev: Support special graphic cards on early startup')
provides=('plymouth')
conflicts=('plymouth')
backup=('etc/plymouth/plymouthd.conf')

source=("git+https://gitlab.freedesktop.org/plymouth/plymouth.git"
       'arch-logo.png'
       'plymouth.encrypt_hook'
       'plymouth.encrypt_install'
       'lxdm-plymouth.service'
       'lightdm-plymouth.service'
       'sddm-plymouth.service'
       'plymouth-deactivate.service' # needed for sddm
       'plymouth.initcpio_hook'
       'plymouth.initcpio_install'
       'sd-plymouth.initcpio_install'
       'plymouth-quit.service.in.patch'
       'plymouth-update-initrd.patch'
       'plymouthd.conf.patch'
)

sha256sums=('SKIP'
            'de4369ad5a5511b684305e3a882c2c56204696514ea8ccdb556dd656eca062e7'
            'ef57ac511f65841fc71a8f7dacaaf3f1a6ad87aaa1fc4105e0ff62579abbca98'
            '373ec20fe4c47e693a0c45cc06dd906e35dd1d70a85546bd1d571391de11763a'
            '06b31999cf60f49e536c7a12bc1c4f75f2671feb848bf5ccb91a963147e2680d'
            '86d0230d9393c9d83eb7bb430e6b0fb5e3f32e78fcd30f3ecd4e6f3c30b18f71'
            'c39f526f7e99173bc8f012900f53257537a25e2d8c19e23df630f1fe9a7627ba'
            '3b17ed58b59a4b60d904c60bba52bae7ad685aa8273f6ceaae08a15870c0a9eb'
            '2a80e2cad8de428358647677afa166219589d3338c5f94838146c804a29e2769'
            '7f220326baaf8c8cfc676b16448a60093b4598c8ff064c6e65891c9a52406764'
            'e2b20357e3fe27698c3de8f873216b1e24b8a1af5e8226b638c001c3048cccd3'
            'dec28b86ddea93704f8479d33e08f81cd7ff4ccaad57e9053c23bd046db2278a'
            '74908ba59cea53c6a9ab67bb6dec1de1616f3851a0fd89bb3c157a1c54e6633a'
            '71d34351b4313da01e1ceeb082d9776599974ce143c87e93f0a465f342a74fd2')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd $_pkgname
	patch -p1 -i $srcdir/plymouth-update-initrd.patch
	patch -p1 -i $srcdir/plymouth-quit.service.in.patch
	patch -p1 -i $srcdir/plymouthd.conf.patch
}

build() {
  local meson_options=(
    -D logo="/usr/share/plymouth/arch-logo.png"
    -D background-color=0x000000
    -D background-start-color-stop=0x000000
    -D background-end-color-stop=0x4D4D4D
    -D gtk=disabled
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  install -Dm644 "$srcdir/arch-logo.png" "$pkgdir/usr/share/plymouth/arch-logo.png"

  install -Dm644 "$srcdir/plymouth.encrypt_hook" "$pkgdir/usr/lib/initcpio/hooks/plymouth-encrypt"
  install -Dm644 "$srcdir/plymouth.encrypt_install" "$pkgdir/usr/lib/initcpio/install/plymouth-encrypt"
  install -Dm644 "$srcdir/plymouth.initcpio_hook" "$pkgdir/usr/lib/initcpio/hooks/plymouth"
  install -Dm644 "$srcdir/plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/plymouth"
  install -Dm644 "$srcdir/sd-plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/sd-plymouth"

  for i in {sddm,lxdm,lightdm}-plymouth.service; do
    install -Dm644 "$srcdir/$i" "$pkgdir/usr/lib/systemd/system/$i"
  done

  install -Dm644 "$srcdir/plymouth-deactivate.service" 	"$pkgdir/usr/lib/systemd/system/plymouth-deactivate.service"
	
  # actually, these scripts are used by dracut...
  # rm -rf "$pkgdir"/usr/lib/plymouth/plymouth-{generate,populate}-initrd
  
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$pkgdir/usr/share/plymouth/plymouthd.defaults" "$pkgdir/etc/plymouth/plymouthd.conf"
}
