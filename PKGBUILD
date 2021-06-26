# Maintainer: cubercsl <2014cais01 at gmail dot com>
# Contributor: amorphobia <pengxuesong.cn@gmail.com>

pkgname=rime-openfly
pkgver=9.9m
pkgrel=3
pkgdesc='词库开源的小鹤音形 Rime 配方'
arch=('any')
url='https://github.com/amorphobia/openfly'
license=('MIT')
depends=('rime-lua-hook')
optdepends=('ibus-rime: input support'
            'fcitx-rime: input support'
            'fcitx5-rime: input support')
makedepends=('librime'
             'rime-prelude')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amorphobia/openfly/archive/v${pkgver}.tar.gz"
        "openfly.lua"
        "openfly-linux.patch"
         "$pkgname.install")
sha256sums=('25210ecdb652179f5f71048174f2792b8d5d5dc7a08ddc67a60e21af2a805ae2'
            '7cd0316f88ee7bc19ef64b8afa82757208daa7f3818819f26395e1775a702368'
            'fc3bb98ef69dcbdb5517b26461cd5ae242d565c35ced0f332a55cba7cefdc805'
            'f90e6ba63a7a347c1cb4dce15782df4f5526ec174659eb23d55fe9f8b4b914cd')
install="$pkgname.install"

prepare() {
    cd "${srcdir}/openfly-${pkgver}"
    for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done

    patch -Np1 -i ../openfly-linux.patch
}

build() {
    cd "${srcdir}/openfly-${pkgver}"
    rime_deployer --compile openfly.schema.yaml
    rime_deployer --compile openfly_reverse.schema.yaml
}

package() {
    cd "${srcdir}/openfly-${pkgver}"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 ../openfly.lua -t "${pkgdir}"/usr/share/rime-data/lua-recipe
    install -Dm644 openfly.{completion,embedded.hint,fast.symbols,off-table,primary,secondary,secondary.short.code,symbols,uncommon,user,user.top,web,whimsicality}.dict.yaml  -t "${pkgdir}"/usr/share/rime-data
    install -Dm644 openfly{,_reverse}.{schema,dict}.yaml -t "${pkgdir}"/usr/share/rime-data
    install -Dm644 build/openfly{,_reverse}.{schema.yaml,table.bin,prism.bin,reverse.bin}  -t "${pkgdir}"/usr/share/rime-data/build
    install -Dm644 lua/openfly_{common,date_translator,deletion_filter,hint_filter,shortcut_processor,shortcut_translator,time_translator}.lua -t  "${pkgdir}"/usr/share/rime-data/lua
}
