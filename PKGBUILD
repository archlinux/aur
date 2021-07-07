# Maintainer: HeartsDo <heartsdo[at]vivaldi[dot]net> 
# Contributor: SlimShadyIAm me[at]slim[dot]ovh

pkgname=premid-git
pkgver=r120.9066f98
pkgrel=1
pkgdesc="PreMiD adds Discord Rich Presence support to a lot of services you use and love."
url='https://github.com/PreMiD/Linux'
arch=('i686' 'x86_64')
license=('MIT')
depends=('nodejs>=10.11.0' 'yarn')
makedepends=('git')
optdepends=('discord: Proper Rich Presence support')
conflicts=('premid')
source=("git+${url}.git")
md5sums=('SKIP') # Git

foldername=Linux

pkgver() {
    cd "${foldername}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    # Get a path of fetched source directory
    _git_rev=`ls ${srcdir}/|grep --regexp="[^-]*$" --only-matching --max-count=1`
    _git_srcdir="${srcdir}"

    # Install dependency modules
    cd "${foldername}"
    yarn install

    # Init the dist app and build electron package
    yarn run dist
    yarn run electron-builder --project ./dist/app/ build --dir -p never # Use a custom one for skip tar.gz, deb and rpm packaging

}

package() {
    
    cd "${foldername}"
    
    # Set up file structure
    mkdir -p "${pkgdir}/opt/${pkgname%-git}/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    
    # Copy the app files, dependency modules, pixmap and desktop entry to package directory
    cd dist/app/dist/linux-unpacked/
    cp -r ./* "${pkgdir}/opt/${pkgname%-git}/"
    cp assets/appIcon.png "${pkgdir}/usr/share/pixmaps/premid.png"
    cp assets/premid.desktop "${pkgdir}/usr/share/applications/"
    
    # Sym-link the executable
    ln -sf /opt/premid/premid  "${pkgdir}/usr/bin/premid"

    # Copy a license file to package directory
    cd "${srcdir}/${foldername}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
