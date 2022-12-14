# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Ian MacKay <immackay0@gmail.com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
# Contributor: Igor Petrov <igorpetrov@users.noreply.github.com>
# Contributor: Jiawen Geng

pkgname=github-desktop
pkgver=3.1.1
_gitname="release-$pkgver-linux1"
pkgrel=3
pkgdesc='GUI for managing Git and GitHub'
arch=(x86_64)
url='https://desktop.github.com'
license=(MIT)
depends=(curl
         git
         libsecret
         libxss
         nspr
         nss
         org.freedesktop.secrets
         unzip)
optdepends=('github-cli: CLI interface for GitHub'
            'hub: CLI interface for GitHub')
makedepends=(nodejs-lts-gallium
             npm
             xorg-server-xvfb
             yarn)
DLAGENTS=("http::/usr/bin/git clone --branch $_gitname --single-branch %u")
source=("$pkgname::git+https://github.com/shiftkey/desktop.git#tag=$_gitname"
        'git+https://github.com/github/gemoji.git'
        'git+https://github.com/github/gitignore.git'
        'git+https://github.com/github/choosealicense.com.git'
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '932e4c456e8c6db03d27172cf0daa37806bf025bb560d8b3d758c0997d1a618c')

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule."gemoji".url "$srcdir/gemoji"
	git config submodule."app/static/common/gitignore".url "$srcdir/gitignore"
	git config submodule."app/static/common/choosealicense.com".url "$srcdir/choosealicense.com"
	git -c protocol.file.allow=always submodule update
	# https://github.com/shiftkey/desktop/issues/809#issuecomment-1348815685
	sed -e '/compile:prod/s/4096/4096 --openssl-legacy-provider/' -i package.json
}

build() {
	cd "$pkgname"
	xvfb-run yarn install
	xvfb-run yarn build:prod
}

package() {
	cd "$pkgname"
	install -d "$pkgdir/opt/$pkgname"
	cp -r --preserve=mode dist/github-desktop-linux-x64/* "$pkgdir/opt/$pkgname/"
	install -Dm0644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	pushd "$pkgdir/opt/$pkgname/resources/app/static/logos"
	install -Dm0644 "1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
	install -Dm0644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	install -Dm0644 "256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	printf "#!/bin/sh\n\n/opt/$pkgname/github-desktop \"\$@\"\n" |
		install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
}
