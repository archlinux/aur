# Maintainer: Ivan Gabaldon <igabaldon[at]inetol.net>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=redhat-fonts
pkgver=4.1.0
pkgrel=1
pkgdesc='Red Hat Typeface fonts'
arch=('any')
url='https://www.redhat.com'
license=('OFL-1.1-RFN AND CC-BY-SA-4.0')
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/RedHatOfficial/RedHatFont/tar.gz/refs/tags/$pkgver"
        '64-redhat-display-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/0335e27c2d9a770ebb1b7bd8649622442617393f/f/64-redhat-display-fontconfig.conf'
        '64-redhat-text-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/0335e27c2d9a770ebb1b7bd8649622442617393f/f/64-redhat-text-fontconfig.conf'
        '64-redhat-mono-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/0335e27c2d9a770ebb1b7bd8649622442617393f/f/64-redhat-mono-fontconfig.conf'
        '64-redhat-display-vf-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/0335e27c2d9a770ebb1b7bd8649622442617393f/f/64-redhat-display-vf-fontconfig.conf'
        '64-redhat-text-vf-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/0335e27c2d9a770ebb1b7bd8649622442617393f/f/64-redhat-text-vf-fontconfig.conf'
        '64-redhat-mono-vf-fontconfig.conf::https://src.fedoraproject.org/rpms/redhat-fonts/raw/0335e27c2d9a770ebb1b7bd8649622442617393f/f/64-redhat-mono-vf-fontconfig.conf')
b2sums=('222888fbdb72de38d483889cf8f24d730cc37ef30c489aafe26f3d3d234666245553b3aec77b574085b629606c5f64f7c41fed03fbf89089a76450e2b3384aaf'
        'f0fc09416894ac586ec434ecf44cd0a8c78e0f80c596f8ead4e5f22e14172f04ad2957f26c5b2c6163ed04f82b3d5ab3a50c4bae28fbfde9a9a9e9eefeeabcce'
        'd9dd219b617993798699e648c04b9ed90e8aa958995f32c42c39a7edeb23e3271e4d48a0adb5baef68f1b6aa1f23257fe917b4cb5f1ae2be6e9d3d21f142a667'
        'a9fefd3fc98c75bf99921f1343a45b8a28c0e6000eeab244732587b48dff2eb967c54bb2fda4f7ff654661bc0177dcef11e8ba095f0be3f4c7214c78f0a09175'
        '25e34e8f8baec04c86a146abf544bd3d3bc96b425cadd629f6114836527483dd0efa2214b4f5b6f687b7d13fe29d18d9265866b802e0b9e2994cfff3dd6a7361'
        '6cdc32b1495229d8b752acb004589b7142b0d6f13dae4880d80c3898b6efeb63362ff7b1e7abae1e17198b5760091e198922d5347af80033855a0a5f7b2c9dde'
        'd547f007d95af6aec98ac42c446a2c9c87b213450621f6f0243737e24a5710f6048ab536d1f7d365e6181eeb1c716507b871a2a3e587834014814a99546172fb')

prepare() {
    mkdir -p "$pkgname-$pkgver/"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver/"
}

package() {
    # Regular
    install -m 0755 -d "$pkgdir/usr/share/fonts/redhat/"
    install -m 0644 -p "$pkgname-$pkgver"/fonts/Mono/otf/*.otf "$pkgdir/usr/share/fonts/redhat/"
    install -m 0644 -p "$pkgname-$pkgver"/fonts/Proportional/*/otf/*.otf "$pkgdir/usr/share/fonts/redhat/"

    # Variable
    install -m 0755 -d "$pkgdir/usr/share/fonts/redhat-vf/"
    install -m 0644 -p "$pkgname-$pkgver"/fonts/Mono/variable/*\[wght\].ttf "$pkgdir/usr/share/fonts/redhat-vf/"
    install -m 0644 -p "$pkgname-$pkgver"/fonts/Proportional/*/variable/*\[wght\].ttf "$pkgdir/usr/share/fonts/redhat-vf/"

    # Fontconfig
    install -m 0755 -d "$pkgdir/usr/share/fontconfig/conf.avail/"
    install -m 0755 -d "$pkgdir/etc/fonts/conf.d/"
    for type in display mono text; do
        install -m 0644 -p "../64-redhat-$type-fontconfig.conf" "$pkgdir/usr/share/fontconfig/conf.avail/64-redhat-$type.conf"
        ln -s "/usr/share/fontconfig/conf.avail/64-redhat-$type.conf" "$pkgdir/etc/fonts/conf.d/64-redhat-$type.conf"

        install -m 0644 -p "../64-redhat-$type-vf-fontconfig.conf" "$pkgdir/usr/share/fontconfig/conf.avail/64-redhat-$type-vf.conf"
        ln -s "/usr/share/fontconfig/conf.avail/64-redhat-$type-vf.conf" "$pkgdir/etc/fonts/conf.d/64-redhat-$type-vf.conf"
    done

    # License
    install -m 0755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -m 0644 -p "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
