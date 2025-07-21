# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

_pkgname=dxvk-gplasync
pkgname=$_pkgname-bin
pkgver=2.7
pkgrel=1
_srcver="v$pkgver-$pkgrel"
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 (with gplasync patch)"
arch=('x86_64')
url="https://gitlab.com/Ph42oN/$_pkgname"
license=('zlib-acknowledgement')
depends=('vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'bash')
optdepends=('wine' 'proton')
provides=("dxvk=$pkgver" 'd8vk' 'd9vk')
conflicts=('dxvk' 'd8vk' 'd9vk')
options=(!strip)
source=("$url/-/raw/main/releases/$_pkgname-$_srcver.tar.gz"
        "$_pkgname-env.conf"
        'setup_dxvk_proton.sh'
        'setup_dxvk.sh::https://aur.archlinux.org/cgit/aur.git/plain/setup_dxvk.sh?h=dxvk-mingw&id=15fc8ab6b1bb285df589359c50540b9c14c1f063') # https://raw.githubusercontent.com/doitsujin/dxvk/4f90d7bf5f9ad785660507e0cb459a14dab5ac75/setup_dxvk.sh
sha256sums=('612e6b059d060bb51a46085ae9abf4036bc1c357e174e3f1924d266c632dfe97'
            '145406e5cf182f6a37ebcb40a38a0cd84f3f547e1943536d03c7d6c6b2b6d950'
            'ce5712e2287b1ab52a9160dd7bacf0694ee3e7a5888bd71a06f27ca67af051d6'
            'b562e8dc9539ef3cd1554c6679eef10aacf21103403d7390a141a41ae146b7a6')

package() {
  cd "$_pkgname-$_srcver" || exit 1

  install -dm755 "$pkgdir/usr/share"
  cp -dr --preserve=mode,timestamp . "$pkgdir/usr/share/dxvk"

  install -Dm 755 "$srcdir/setup_dxvk.sh" "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
  install -Dm 755 "$srcdir/setup_dxvk_proton.sh" "$pkgdir/usr/share/dxvk/setup_dxvk_proton.sh"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
  ln -s /usr/share/dxvk/setup_dxvk_proton.sh "$pkgdir/usr/bin/setup_dxvk_proton"

  install -dm755 "$pkgdir/etc/environment.d"
  install -Dm644 "$srcdir/$_pkgname-env.conf" "$pkgdir/etc/environment.d/$_pkgname-env.conf"
}
