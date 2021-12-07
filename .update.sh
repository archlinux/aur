pkgname=uptime-kuma
url="https://github.com/louislam/${pkgname}"

# Getting last version
pkgver=`curl --silent \
  "https://api.github.com/repos/louislam/uptime-kuma/releases/latest" \
  | grep -Po '"tag_name": "\K.*?(?=")'`

# Getting sha256sums
sum1=($(curl -sL "${url}/archive/refs/tags/${pkgver}.tar.gz" | sha256sum))
sum2=($(curl -sL "${url}/releases/download/${pkgver}/dist.tar.gz" | sha256sum))
sum3=($(sha256sum uptime-kuma.service))
sums="('$sum1' '$sum2' '$sum3')"


# Modifying PKGBUILD with the last version and sums
sed -i -e "/pkgver=/ s/=.*/=$pkgver/" PKGBUILD
sed -i -e "/sha256sums=/ s/=.*/=$sums/" PKGBUILD

# .SRCINFO generation
makepkg --printsrcinfo > .SRCINFO

# Git commit
git diff
git commit -am "Updating to $pkgver"
