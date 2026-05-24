# Maintainer: Artem Pshenichnikov <Stodvalista@yandex.ru>
#
# chowdy — резидентный C++ daemon + PAM модуль для face-аутентификации
# по IR-камере. Альтернатива Howdy с холодным auth < 400 мс. См. DESIGN.md.
#
# Для разработки (сборка из локального git checkout без выхода в сеть)
# используй `tools/install-dev.sh` — он не трогает pacman и подходит
# для быстрой итерации.

pkgname=chowdy
pkgver=0.1.0
pkgrel=1
pkgdesc='Resident C++ face-auth daemon for Linux (IR-only, PAM)'
arch=('x86_64')
url='https://github.com/q-artem/chowdy'
license=('MIT')
depends=(
    'opencv'
    'libsodium'
    'systemd-libs'
    'pam'
    'onnxruntime'
    'nlohmann-json'
    'tomlplusplus'
)
makedepends=(
    'cmake'
    'ninja'
    'pkgconf'
)
backup=('etc/chowdy/config.toml')
install=chowdy.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/q-artem/chowdy/archive/v$pkgver.tar.gz")
sha256sums=('2517b4a1ac0008dcf518f909bbd3772fc493fae745d3a771eb9336e0ab544788')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -S . -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCHOWDY_BUILD_TOOLS=OFF \
        -DCHOWDY_BUILD_TESTS=OFF \
        -DCHOWDY_BUILD_PAM=ON
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Бинарники
    install -Dm0755 build/daemon/chowdyd       "$pkgdir/usr/bin/chowdyd"
    install -Dm0755 build/cli/chowdy-cli       "$pkgdir/usr/bin/chowdy-cli"

    # PAM модуль (НЕ подключается к auth stack автоматически — это руками
    # по чек-листу /usr/share/doc/chowdy/PAM-INSTALL.md).
    install -Dm0755 build/pam/pam_chowdy.so    "$pkgdir/usr/lib/security/pam_chowdy.so"

    # systemd units (включаются вручную через `systemctl enable chowdyd.socket`)
    install -Dm0644 systemd/chowdyd.service    "$pkgdir/usr/lib/systemd/system/chowdyd.service"
    install -Dm0644 systemd/chowdyd.socket     "$pkgdir/usr/lib/systemd/system/chowdyd.socket"
    install -Dm0644 systemd/tmpfiles.d/chowdy.conf \
                                                 "$pkgdir/usr/lib/tmpfiles.d/chowdy.conf"

    # Дефолтный конфиг (помечен как backup= — правки переживут upgrade)
    install -Dm0644 etc/chowdy/config.toml.example \
                                                 "$pkgdir/etc/chowdy/config.toml"

    # Документация
    install -Dm0644 README.md                    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 DESIGN.md                    "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
    install -Dm0644 pam/README.md                "$pkgdir/usr/share/doc/$pkgname/PAM-INSTALL.md"
    install -Dm0644 models/README.md             "$pkgdir/usr/share/doc/$pkgname/MODELS.md"
    install -Dm0644 systemd/README.md            "$pkgdir/usr/share/doc/$pkgname/SYSTEMD.md"
    install -Dm0644 LICENSE                      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
