# Maintainer: EndlessEden <eden@rose.place>
pkgname=srbminer-multi
pkgver=1.0.0
_pkgver="$(echo $pkgver | sed 's,\.,-,g')"
pkgrel=1
pkgdesc="CPU & AMD GPU Miner: Mine up to 4 different algorithms/coins at the same time! - auto package update(just-rerun if page updates and leave comment)"
arch=('x86_64')
url="https://github.com/doktor83/SRBMiner-Multi"
license=('Private')
makedepends=('tar' 'xz' 'git' 'curl')
optdepends=('opencl-amd: For Mining on AMD GPUs')
newver="$(git ls-remote --tags https://github.com/doktor83/SRBMiner-Multi.git | sed 's,e70f870a6b096db48925edb9966bd05ee21106e7      refs/tags/v.0.1.0,,g' | tail -2 | head -1 | sed 's,refs/tags/,\n,g' | tail -1)"


if [ ! "$newver" == "$pkgver" ]; then
source=("$pkgname-$newver.tar.xz"::"https://github.com/doktor83/SRBMiner-Multi/releases/download/$newver/SRBMiner-Multi-$(echo $newver | sed 's,\.,-,g')-Linux.tar.xz")
md5sums=($(curl --silent https://api.github.com/repos/doktor83/SRBMiner-Multi/releases/latest | sed 's,zip,\n,g' | grep '*SRBMiner-Multi' | grep Linux | sed 's,[\]r[\]n,\n,g; s, ,\n,g' | head -2 | tail -1))
if [ -z $md5sums ]; then
echo "md5sums came back null from github api, rate limit must be exceeded."
md5sums=("SKIP") # Other options was to put it as gibberish... but the chance of exceeding rate is low (although i did locally after 130 requets)
fi
else
source=("$pkgname-$pkgver.tar.xz"::"https://github.com/doktor83/SRBMiner-Multi/releases/download/$pkgver/SRBMiner-Multi-$(echo $pkgver | sed 's,\.,-,g')-Linux.tar.xz")
md5sums=($(curl --silent https://api.github.com/repos/doktor83/SRBMiner-Multi/releases | grep $_pkgver | sed 's,zip,\n,g' | grep '*SRBMiner-Multi' | grep Linux | sed 's,[\]r[\]n,\n,g; s, ,\n,g' | head -2 | tail -1))
if [ -z $md5sums ]; then
echo "md5sums came back null from github api, rate limit must be exceeded."
md5sums=("246e4df7799b9e1237bce09cf0c7a2c0")
fi
fi

pkgver() {
if [ ! "$newver" == "$pkgver" ]; then
echo $newver
else
echo $pkgver
fi
}

if [ -z $ood ]; then
if [ ! "$newver" == "$pkgver" ]; then
export ood="1"
else
export ood="0"
fi
fi


prepare() {
echo " "
echo "Checking for package updates..."
echo " "
newver="$(git ls-remote --tags https://github.com/doktor83/SRBMiner-Multi.git | sed 's,e70f870a6b096db48925edb9966bd05ee21106e7      refs/tags/v.0.1.0,,g' | tail -2 | head -1 | sed 's,refs/tags/,\n,g' | tail -1)"
echo "Upstream Version: $newver"
echo "pkgver: $pkgver"
echo "Are we out of date?(1 = yes, 0 = no): $ood"
echo " "

  cd "${srcdir}"
  if [ "$ood" == "1" ]; then
         if [ ! -d "SRBMiner-Multi-$(echo $pkgver | sed 's,\.,-,g')" ]; then
	  if [ ! -d "$pkgname-$pkgver" ]; then
 		 mv "SRBMiner-Multi-$(echo $newver | sed 's,\.,-,g')" "$pkgname-$newver"
  	  fi
         fi
  else
	  if [ ! -d "$pkgname-$pkgver" ]; then
		  mv "SRBMiner-Multi-$(echo $pkgver | sed 's,\.,-,g')" "$pkgname-$pkgver"
	  fi
  fi
}

package() {
  install -d "${pkgdir}"/opt/$pkgname
  install -d "${pkgdir}"/usr/bin/
  install -D "${srcdir}"/"$pkgname-$pkgver"/{*.sh,SRBMiner-MULTI} "${pkgdir}"/opt/$pkgname
  cp -r "${srcdir}"/"$pkgname-$pkgver"/{Cache,Examples,Help} "${pkgdir}"/opt/$pkgname
  ln -s /opt/$pkgname/SRBMiner-MULTI "${pkgdir}"/usr/bin/srbminer-multi
}
