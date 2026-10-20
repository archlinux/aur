# Maintainer: HitCoder <hitcoder9768@gmail.com>
pkgname=openutau-git
pkgver=r1211.4254d16
pkgrel=2
epoch=
pkgdesc="An open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('dotnet-host' 'dotnet-runtime' 'dotnet-targeting-pack' 'dotnet-sdk' 'fuse2' 'fuse3' 'fuse-common')
options=(staticlibs)
source=("git+https://github.com/stakira/OpenUtau.git"
        "openutau.desktop"
        "openutau.svg")
sha256sums=('SKIP'
            '46cdff454ee6ea172ccdd912d64480a2ce7ffc123a89b183ffc74e314fc3c854'
            '490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b')

pkgver() {
    cd "$srcdir"/OpenUtau
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/OpenUtau

	# arch doesn't support arm and openutau doesn't support x86 :/
	dotnet restore OpenUtau -r linux-x64
	dotnet publish OpenUtau -c Release -r linux-x64 --self-contained true -o bin/linux-x64
}

package() {

    # Copy libraries
    install -Dm755 "$srcdir"/OpenUtau/bin/linux-x64/OpenUtau \
      "$pkgdir"/usr/lib/"$pkgname"/OpenUtau
    cp -r "$srcdir"/OpenUtau/bin/linux-x64/* "$pkgdir"/usr/lib/$pkgname/

    # Wrapper
    echo "#!/bin/sh" > "$srcdir"/openutau
    echo "exec /usr/lib/$pkgname/OpenUtau" >> "$srcdir"/openutau
    install -Dm755 "$srcdir"/openutau "$pkgdir"/usr/bin/openutau

    # Icon
    install -Dm644 "$srcdir"/openutau.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/openutau.svg

    # Desktop file
    install -Dm644 "$srcdir"/openutau.desktop "$pkgdir"/usr/share/applications/openutau.desktop
}
