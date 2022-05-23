# Maintainer: HitCoder <hitcoder9768@gmail.com>
pkgname=openutau-git
pkgver=r1211.4254d16
pkgrel=1
epoch=
pkgdesc="An open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('dotnet-host' 'dotnet-runtime' 'dotnet-targeting-pack' 'dotnet-sdk' 'fuse2' 'fuse3' 'fuse-common')
options=(staticlibs)
source=("git+https://github.com/stakira/OpenUtau.git"
        "OpenUtau-git.desktop")
sha256sums=('SKIP'
            'da52ea07cc3507d8bfead0df5c955dc66265acade1c2fc1821816319c09e8b15')

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
    install -Dm644 "$srcdir"/OpenUtau/Logo/openutau.svg "$pkgdir"/usr/share/pixmaps/openutau.svg

    # Desktop file
    install -Dm644 "$srcdir"/OpenUtau-git.desktop "$pkgdir"/usr/share/applications/OpenUtau-git.desktop
}
