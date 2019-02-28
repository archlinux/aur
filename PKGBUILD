# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=ubports-installer-git
pkgver=0.1.21_beta.r23.ga569e6b
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=(any)
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'electron2')
makedepends=('git' 'npm')
provides=('ubports-installer')
conflicts=('ubports-installer')
source=("$pkgname::git+${url}.git"
        ubports-installer
        ubports-installer.desktop
        use-system-electron2.patch)
sha512sums=('SKIP'
            '55bba31095b0d38b3571e274be585abd426cfb30bbda42244dcb11ebc183d87bf8db040884f46072e4e66a682fe828d9983e5cefc20c46ddbd49ba047121287f'
            '5370dae98ea52ef6d1a6d35cc15774687457836cc7a74538d32279617db329f215989863f15ed46d3aba7e384d703161a1cf6ae92101d88c8efa1445464bea59'
            'c380783750dddfb67f0f26b34981f345cc0366643f6d0a04c970d357ed2586e748acc10352e96982f7353553e120ee1156e7b55d8765c765997e38f7284f0f55')

pkgver() {
	cd "$pkgname"
    git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
    local cache="$srcdir/npm-cache"

    # this will be very useful in near future
    #patch -p1 -d "$pkgname" < use-system-electron2.patch

	cd "$pkgname"
    npm install --cache "$cache" "electron@$(sed 's/^v//' </usr/lib/electron2/version)"
    npm install --cache "$cache"
}

build() {
	cd "$pkgname"
    node build.js --build-to-dir --linux --no-platform-tools
}

package() {
    install -Dm755 ubports-installer "$pkgdir/usr/bin/ubports-installer"

    cd "$pkgname/build/icons"
    for i in *x*.png; do
        install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
    done

	cd "$srcdir/$pkgname/dist/linux-unpacked/resources"

    install -dm755 "$pkgdir/usr/share/ubports-installer/app.asar.unpacked/node_modules"
    install -m644 app.asar "$pkgdir/usr/share/ubports-installer/app.asar"
    cp -r app.asar.unpacked/node_modules/electron-sudo \
        "$pkgdir/usr/share/ubports-installer/app.asar.unpacked/node_modules"
}
