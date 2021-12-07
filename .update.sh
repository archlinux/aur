# Getting last version
pkgver=`curl --silent \
  "https://api.github.com/repos/louislam/uptime-kuma/releases/latest" \
  | grep -Po '"tag_name": "\K.*?(?=")'`

# Modifying PKGBUILD with the last version
sed -i -e "/pkgver=/ s/=.*/=$pkgver/" PKGBUILD

# .SRCINFO generation
makepkg --printsrcinfo > .SRCINFO

# Git commit
git commit -am "Updating to $pkgver"
