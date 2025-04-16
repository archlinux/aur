pkgname=fdroidserver
pkgver=2.4.0
epoch=1
pkgrel=1
pkgdesc="F-Droid repository management tools"
url="https://gitlab.com/fdroid/$pkgname"
license=('GPL3')
depends=('python' 'python-pyasn1' 'python-pyasn1-modules' 'python-magic' 'python-requests' 'python-yaml' 'python-ruamel-yaml' 'java-environment' 'python-pillow' 'python-vagrant' 'python-gitpython' 'python-asn1crypto' 'python-paramiko' 'python-qrcode')
makedepends=('python-setuptools' 'python-babel')
optdepends=(
     'android-sdk: Build apps from source'
     'android-sdk-build-tools: Work with apks in the repository'
     'android-sdk-platform-tools: Ability to install apps to connected devices'
     'android-ndk: Build apps that use native code'
     'apache-ant: Build apps using Apache Ant'
     'maven: Build apps using Maven'
     'gradle: Build apps using Gradle'
     'android-support-repository: Build apps using Maven or Gradle that use support libraries'
     'git: Download app sources that use git or svn (via git svn)'
     'mercurial: Download app sources that use hg'
     'bzr: Download app sources that use bzr'
     'python-pillow: Resize and manage app icons'
     'rsync: Transfer repo files to the web server'
     'vagrant: Buildserver virtual machine support'
     'virtualbox: Buildserver virtual machine support'
     'wordpress: Web repository plugin'
     )
arch=('any')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/fdroid/fdroidserver/-/archive/${pkgver}/fdroidserver-${pkgver}.tar.gz")
sha256sums=('a1b154c47d4233ab0abb4c4fd8d60da4aaa3142448c55901e5d924113085f0ad')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py compile_catalog
    python setup.py bdist_egg
    python setup.py install --root="$pkgdir/" --optimize=1 --install-data="/usr"

    mkdir -p "$pkgdir/usr/bin"
    install "fdroid" "$pkgdir/usr/bin"
    #install "fd-commit" "$pkgdir/usr/bin"
    install -D gradlew-fdroid "$pkgdir/usr/lib/python$(python --version|cut -f2 -d" "|cut -f1,2 -d".")/site-packages/gradlew-fdroid"

    install -D completion/bash-completion "$pkgdir/usr/share/bash-completion/completions/fdroidserver"

    mkdir -p "$pkgdir/opt/android-sdk/tools"
}
