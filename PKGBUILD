# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

_pkgname=dxvk-gplasync
pkgname=$_pkgname-bin
pkgver=2.4.1
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
        'setup_dxvk.sh') # https://raw.githubusercontent.com/doitsujin/dxvk/4f90d7bf5f9ad785660507e0cb459a14dab5ac75/setup_dxvk.sh
sha256sums=('ee96eaf60d3d924434cced411b80d7f0669d97b7121db1890bf2b18e71f8a1f4'
            '2bce3bf5dc5a3c7312bbaae96daf82e0fe6c370e96017ce5a0c49f40901866e3'
            'ce5712e2287b1ab52a9160dd7bacf0694ee3e7a5888bd71a06f27ca67af051d6'
            '778ec44acc09ac9c718354c9a96776b60bd4156dacf584e5c29b2c9697c76684')

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
