# Guidelines specific to Bazaar, Git, Mercurial and Subversion packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: minerharry <miner.harry567@gmail.com>
pkgname=keysharp-git
pkgver=r1921.38a1536
pkgrel=1
pkgdesc="Cross-platform rewrite of AutoHotkey in C#. Fork of now-defunct IronAHK. X11 version."
arch=('x86_64')
url="https://github.com/Descolada/keysharp"
license=('GPL-3.0-or-later')
groups=()
depends=(
    'dotnet-runtime' #.NET/C# SDK
    'rsync' #needed for install script
    'libx11' 'libxtst' 'libxinerama' 'libxt' 'libxkbcommon-x11' 'libxcb' 'gtk3' 'libnotify' 'at-spi2-core' #keysharp's explicitly listed deps
    'glibc' 'gcc-libs' #extra lib deps picked up by checkpkg, seems obvious but w/e
    )
makedepends=('git' 'dotnet-sdk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=keysharp.install
source=("keysharp::git+https://github.com/Descolada/keysharp"
        "Eto::git+https://github.com/Descolada/Eto")
noextract=()
sha256sums=('SKIP' 'SKIP')


# Please refer to the USING VCS SOURCES section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  # only using the keysharp commits as version #s since the Eto fork is updated much less frequently. TODO: multiplex commits somehow? 
  cd "keysharp"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )

}

build() {
  cd "keysharp"
  
  #run build script, places built files in keysharp/dist/keysharp-linux-x64
  chmod +x Keysharp.Install/package-linux.sh
  ./Keysharp.Install/package-linux.sh

}

#check() {
  #cd "keysharp"
  #make -k check
#}

package() {
  cd "keysharp/dist/keysharp-linux-x64"
  find . -type f -exec install -D "{}" "${pkgdir}/usr/share/keysharp/{}" \;


  #make install/uninstall scripts executable
  chmod +x "${pkgdir}/usr/share/keysharp/install.sh"
  chmod +x "${pkgdir}/usr/share/keysharp/uninstall.sh"

  #actual installation/uninstallation happens in keysharp.install
}
