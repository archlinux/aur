# Maintainer: nnadams <nick@mutablemango.com>
# 
# Reference design "ncmdump-latest-bin" by xihale

## options
: ${_pkgtype:=-latest-bin}

pkgname="glasskube$_pkgtype"
pkgver=v0.24.0
pkgrel=1
pkgdesc="The next generation Package Manager for Kubernetes."
arch=("x86_64")
license=('Apache-2.0')
url="https://github.com/glasskube/glasskube"

_main() {
  _json=`curl -s "https://api.github.com/repos/glasskube/glasskube/releases?per_page=1"`
  
  _pkgver=`echo "$_json" | sed -n '/"tag_name"/p' | head -n 1 | awk -F'"' '{print $4}'`

  _zip_url=`echo "$_json" | sed -n '/browser_download_url.*_linux_x86_64.tar.gz/p' | awk -F'"' '{print $4}'`
}

pkgver() {
  if [ -z "$_pkgver" ]; then
    echo "Couldn't get the package info from https://api.github.com/repos/glasskube/glasskube/releases?per_page=1"
    exit
  else
    echo "$_pkgver"
  fi
}

package() {
  filename=`basename $_zip_url`
  echo $_zip_url $filename
  curl -L -o $filename -C - $_zip_url

  bsdtar -xf $filename

  install -Dm755 "glasskube" -t "$pkgdir/usr/bin/"
}

_main

