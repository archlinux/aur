# Guidelines specific to Bazaar, Git, Mercurial and Subversion packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: minerharry <miner.harry567@gmail.com>
pkgname=keysharp-git
pkgver=v0.0.0.18.r113.gea48a15
pkgrel=1
pkgdesc="Cross-platform rewrite of AutoHotkey in C#. Fork of now-defunct IronAHK. Compatible with X11 and Wayland."
arch=('x86_64')
url="https://github.com/keysharp-org/Keysharp/"
license=('GPL-3.0-or-later')
groups=()
depends=(
    'dotnet-runtime>=10.0' #.NET/C# SDK
    'rsync' #needed for install script
    'libx11' 'libxtst' 'libxinerama' 'libxt' 'libxkbcommon-x11' 'libxcb' 'gtk3' 'libnotify' 'at-spi2-core' 'polkit' #keysharp's explicitly listed deps
    'glibc' 'gcc-libs' #extra lib deps picked up by checkpkg, seems obvious but w/e
    )
optdepends=('keysharp-input-git: Input interface for Linux'
            'keysharp-desktop-git: Desktop interfaces'
            'polkit-kde-agent: KDE polkit auth GUI'
            'mate-polkit: Mate desktop polkit auth GUI'
            'polkit-gnome: GNOME desktop polkit auth GUI')
makedepends=('git' 'dotnet-sdk>=10.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("keysharp::git+https://github.com/keysharp-org/keysharp"
        "Eto::git+https://github.com/keysharp-org/Eto#branch=Keysharp")
noextract=()
sha256sums=('SKIP' 'SKIP')


pkgver() {
  # only using the keysharp commits as version #s since the Eto fork is updated much less frequently. 
  cd "keysharp"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )

}

build() {
  cd "$srcdir/keysharp"
  
  #run build script, places built files in keysharp/dist/keysharp-linux-x64
  bash Keysharp.Install/package-linux.sh --stage
}

package() {
  cd "$srcdir/keysharp"
  
  #installs built files to $pkgdir/usr/lib/keysharp 
  bash Keysharp.Install/package-linux.sh --install "$pkgdir"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/keysharp/license.txt"
}
