# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-nightly-bin
pkgver=1.16.26
pkgrel=10
pkgdesc='Web browser that blocks ads and trackers by default (nightly binary release).'
arch=('x86_64')
url='https://brave.com/download-nightly'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time')
provides=("${pkgname}" 'brave-nightly-browser')
conflicts=("${pkgname}" 'brave-bin')
source=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-nightly_${pkgver}_amd64.deb"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh"
        "$pkgname.desktop")
options=(!strip)
sha512sums=('8c910d2345c2f03ea205bdacddebd19fd49e75d98f02fd67d824534ff981fd5e0c150042965f413cf1a3acb7211d7815edbc2a1cc452ab590b619b8a15a7b0c0'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '22224d272b4a996d1d77564ca14f2e223ed872e556b9d6d7c5191e455694c939939bf04393e314aa5b6a9f802b0453f4f1ad8192063848e38426ab802e73465d'
            '86cf37b0dc8b37390da9341200af511721c8d2d81ccd45f565322271654058cf47680ae263cf5339feddd42d16bfce7f0aa824f2a45a7c446ed81fe6f749bb92')
#noextract=("$pkgname-$pkgver.zip")

# brave-browser-nightly_1.16.23_amd64.deb
# https://github.com/brave/brave-browser/releases/download/v1.16.23/brave-browser-nightly_1.16.23_amd64.deb

prepare() {
  mkdir -p brave
  bsdtar -C brave -xf data.tar.xz
  ls -l brave
  # Delete unneeded things for debian
  rm -rf brave/opt/brave.com/brave-nightly/cron
    
  # todo: add default-app-block to /usr/share/gnome-control-center/default-apps/gnome-default-applications.xml if it exists. look-at: control.tar.gz/postinst
}

package() {
#    install -d -m0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto brave/opt "$pkgdir/opt"
    cp -a --reflink=auto brave/usr "$pkgdir/usr"
    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-nightly"
    install -Dm0644 "brave/opt/brave.com/brave-nightly/product_logo_128_nightly.png" "$pkgdir/usr/share/pixmaps/brave-nightly.png"

    install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/brave-nightly/LICENSE"
}
