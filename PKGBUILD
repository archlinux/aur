# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname=dxvk-gplasync-bin-git
pkgver=6389635175
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 (with gplasync patch) (CI BUILD)"
arch=('x86_64')
url="https://gitlab.com/Ph42oN/dxvk-gplasync"
license=('zlib-acknowledgement')
depends=('vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'bash')
optdepends=('wine' 'proton')
provides=("dxvk=$pkgver" 'd9vk')
conflicts=('dxvk' 'd9vk')
options=(!strip)
source=("$pkgname.zip::https://gitlab.com/Ph42oN/dxvk-gplasync/-/jobs/artifacts/test/download?job=build"
        'dxvk-gplasync-env.conf'
        'setup_dxvk_proton.sh'
        'https://raw.githubusercontent.com/doitsujin/dxvk/4f90d7bf5f9ad785660507e0cb459a14dab5ac75/setup_dxvk.sh')
sha256sums=('SKIP'
            '2bce3bf5dc5a3c7312bbaae96daf82e0fe6c370e96017ce5a0c49f40901866e3'
            '64fbbf9f30f2f4e8d1d82b088ade92f1bf8817a4bf6e21d7dd978f4276abe1a6'
            '0f688815530ab5e8cc89b9b45d9b1d66cd8cd5a7770fb8249339af555a30dfe7')

pkgver() {
  curl -f "https://gitlab.com/Ph42oN/dxvk-gplasync/-/jobs/artifacts/test/download?job=build" | grep -oP '(?<=jobs\/)\d+'
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
  install -Dm644 "$srcdir/dxvk-gplasync-env.conf" "$pkgdir/etc/environment.d/dxvk-gplasync-env.conf"
}
