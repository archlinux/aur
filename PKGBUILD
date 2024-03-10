# Maintainer: Sieve Lau <sievelau@gmail.com>

pkgname=bililiverecorder-git
pkgver=r897.afae6d0
pkgrel=1
pkgdesc='BiliBili Stream Recorder. Git version.'
url="https://github.com/BililiveRecorder/BililiveRecorder"
arch=(x86_64)
provides=('bililiverecorder')
conflicts=('bililiverecorder')
license=(GPL3)
makedepends=('npm' 'dotnet-sdk-6.0-bin>6.0.22.sdk400')
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
  # The upstream author set language version to 11.0
  # which is not supported by the latest dotnet 6.0 sdk on linux
  # if build using dotnet 7.0, although no error is reported during the build stage
  # the executable will be unable to connect to the danmaku server
  # Logging errors like: 连接弹幕服务器时出错,
  # Could not load file or assembly 'System.IO.Pipelines, Version=7.0.0.0, Culture=neutral, PublicKeyToken=cc7b13ffcd2ddd51'. The system cannot find the file specified.
  # Setting it to version 10.0 will fix the langversion problem, but brings another problem:
  # error CS8652: The feature 'raw string literals' is currently in Preview and *unsupported*. To use Preview features, use the 'preview' language version. [/home/sieve/bililiverecorder-git/src/bililiverecorder/BililiveRecorder.Core/BililiveRecorder.Core.csproj]
  # So the only option is 'preview'
  sed -i 's/<LangVersion>11.0<\/LangVersion>/<LangVersion>preview<\/LangVersion>/' Directory.Build.props
}

build() {
  cd "$srcdir/${pkgname%-git}"
  # setting a global var for package()
  export _bindir=$srcdir/${pkgname%-git}/binaries
  mkdir -p $_bindir
  # build webui
  ./webui/build.sh
  # build the executable
  dotnet build --configuration Release --runtime linux-x64 --self-contained BililiveRecorder.Cli
  # the "dotnet publish" has to be here
  # because it will fail without any error info in package() 
  dotnet publish --configuration Release --runtime linux-x64 --self-contained -o $_bindir BililiveRecorder.Cli 
}

package() {
    _execfile=BililiveRecorder.Cli
    mkdir -p "${pkgdir}/opt/${pkgname/-git/}"
    cp -r $_bindir/* ${pkgdir}/opt/${pkgname/-git/}/
    # change permission, because the default permission is 777
    find ${pkgdir}/opt/${pkgname/-git/} -type f -exec chmod 444 {} \;
    # add back the execute permission for the main binary file
    chmod +x ${pkgdir}/opt/${pkgname/-git/}/${_execfile}
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/${pkgname/-git/}/${_execfile} ${pkgdir}/usr/bin/${_execfile}
}
