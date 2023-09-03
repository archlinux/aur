# Maintainer: Sieve Lau <sievelau@gmail.com>

pkgname=bililiverecorder-git
pkgver=r880.bced5b4
pkgrel=1
pkgdesc='BiliBili Stream Recorder. Git version.'
url="https://github.com/BililiveRecorder/BililiveRecorder"
arch=(x86_64)
provides=('bililiverecorder')
conflicts=('bililiverecorder')
license=(GPL3)
makedepends=('npm' 'dotnet-sdk-7.0')
source=(
  "${pkgname%-git}::git+https://github.com/BililiveRecorder/BililiveRecorder#branch=dev"
  "webui-source::git+https://github.com/BililiveRecorder/BililiveRecorder-WebUI.git"
  "test-data::git+https://github.com/BililiveRecorder/test-data.git"
)
md5sums=(
'SKIP'
'SKIP'
'SKIP'
)

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare(){
  cd ${pkgname%-git}
  git submodule init
  git config submodule.webui/source.url "$srcdir/webui-source"
  git config submodule.test/data.url "$srcdir/test-data"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/${pkgname%-git}"
  # setting a global var for package()
  export _bindir=$srcdir/${pkgname%-git}/binaries
  mkdir -p $_bindir
  ./webui/build.sh
  dotnet build --configuration Release --runtime linux-x64 BililiveRecorder.Cli
  # the "dotnet publish" has to be here
  # because it will fail without any error info in package() 
  dotnet publish --configuration Release --runtime linux-x64 -o $_bindir BililiveRecorder.Cli 
}

package() {
    _execfile=BililiveRecorder.Cli
    mkdir -p "${pkgdir}/opt/${pkgname/-git/}"
    cp -r $_bindir/* ${pkgdir}/opt/${pkgname/-git/}/
    find ${pkgdir}/opt/${pkgname/-git/} -type f -exec chmod 444 {} \;
    chmod +x ${pkgdir}/opt/${pkgname/-git/}/${_execfile}
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/${pkgname/-git/}/${_execfile} ${pkgdir}/usr/bin/${_execfile}
}
