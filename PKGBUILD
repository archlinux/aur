# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

_pkgname=dxvk-gplasync
pkgname=$_pkgname-bin-git
pkgver=9849414907
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 (with gplasync patch) (CI BUILD)"
arch=('x86_64')
url="https://gitlab.com/Ph42oN/$_pkgname"
license=('zlib-acknowledgement')
depends=('vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'bash')
optdepends=('wine' 'proton')
provides=("dxvk=$pkgver" 'd8vk' 'd9vk')
conflicts=('dxvk' 'd8vk' 'd9vk')
options=(!strip)
source=("$_pkgname.zip::https://gitlab.com/Ph42oN/dxvk-gplasync/-/jobs/artifacts/test/download?job=build"
        "$_pkgname-env.conf"
        'setup_dxvk_proton.sh'
        'setup_dxvk.sh::https://aur.archlinux.org/cgit/aur.git/plain/setup_dxvk.sh?h=dxvk-mingw&id=15fc8ab6b1bb285df589359c50540b9c14c1f063')
sha256sums=('SKIP'
            '2bce3bf5dc5a3c7312bbaae96daf82e0fe6c370e96017ce5a0c49f40901866e3'
            'ce5712e2287b1ab52a9160dd7bacf0694ee3e7a5888bd71a06f27ca67af051d6'
            'b562e8dc9539ef3cd1554c6679eef10aacf21103403d7390a141a41ae146b7a6')

pkgver() {
  curl -fI "https://gitlab.com/Ph42oN/dxvk-gplasync/-/jobs/artifacts/test/download?job=build" | grep -oP '(?<=jobs\/)\d+'
}

package() {
  cd "dxvk-gplasync-test" || exit 1

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
