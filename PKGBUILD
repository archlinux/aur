# Maintainer Daniel Landau <daniel.landau@iki.fi>
# Contributor: Prurigro
# Ported from the package by AlexanderR <alexander r at gmx com>

_pkgname=fdroidserver
pkgname=${_pkgname}-git
pkgver=r2871.c91fca7
pkgrel=3
pkgdesc="F-Droid repository management tools"
url="https://gitlab.com/fdroid/$_pkgname"
license=('GPL3')
depends=('python2' 'python2-pyasn1' 'python2-pyasn1-modules' 'python2-magic')
makedepends=('git' 'python2-setuptools' 'python2-pillow' 'python2-paramiko' 'java-environment')
optdepends=(
     'android-sdk: Build apps from source'
     'android-sdk-build-tools: Work with apks in the repository'
     'android-sdk-platform-tools: Ability to install apps to connected devices'
     'android-ndk: Build apps that use native code'
     'java-runtime: Run a repository'
     'apache-ant: Build apps using Apache Ant'
     'maven: Build apps using Maven'
     'gradle: Build apps using Gradle'
     'android-support-repository: Build apps using Maven or Gradle that use support libraries'
     'git: Download app sources that use git or svn (via git svn)'
     'mercurial: Download app sources that use hg'
     'bzr: Download app sources that use bzr'
     'python2-pillow: Resize and manage app icons'
     'python2-paramiko: SSH2 support'
     'rsync: Transfer repo files to the web server'
     'vagrant: Buildserver virtual machine support'
     'virtualbox: Buildserver virtual machine support'
     'wordpress: Web repository plugin'
     )
arch=('any')
options=(!emptydirs)
source=("git+https://gitlab.com/fdroid/fdroidserver.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"

    python2 setup.py install --root="$pkgdir/" --optimize=1 --install-data="/tmp" || true
    rm -rf "$pkgdir/tmp"

    mkdir -p "$pkgdir/usr/bin"
    install "fdroid" "$pkgdir/usr/bin"
    install "fd-commit" "$pkgdir/usr/bin"

    install -D completion/bash-completion "$pkgdir/usr/share/bash-completion/completions/fdroidserver"

    install -D "examples/config.py" "$pkgdir/usr/share/$_pkgname/config.sample.py"
    mkdir -p "$pkgdir/opt/android-sdk/tools"
}
