# Maintainer: xihale <xihale.top@qq.com>

## options
: ${_pkgtype:=-latest-bin}

pkgname="ncmdump$_pkgtype"
pkgver=1.5.0
pkgrel=1
pkgdesc="Convert ncm files to mp3 or flac."
arch=("x86_64")
license=('MIT')
url="https://github.com/taurusxin/ncmdump"

_main(){

  _json=`curl -s "https://api.github.com/repos/taurusxin/ncmdump/releases?per_page=1"`
  
  _pkgver=`echo "$_json" | sed -n '/"tag_name"/p' | head -n 1 | awk -F'"' '{print $4}'`

  _zip_url=`echo "$_json" | sed -n '/browser_download_url.*linux.*/p' | awk -F'"' '{print $4}'`
    
}

pkgver(){

  if [ -z "$_pkgver" ]; then
    echo "Can't get the package info from https://api.github.com/repos/taurusxin/ncmdump/releases?per_page=1"
    exit
  else
    echo "$_pkgver"
  fi

}

package() {

  # get the package
  filename=`basename $_zip_url`
  echo $_zip_url $filename
  curl -L -o $filename -C - $_zip_url # continuous transmission on the breakpoint if file exist.

  # extract
  bsdtar -xf $filename

  install -Dm755 "ncmdump" -t "$pkgdir/usr/bin/"
}

_main
