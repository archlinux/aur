pkgname=cloudshack-git
_pkgname=cloudshack
pkgver=20170708
pkgrel=1
pkgdesc="Amateur Radio logbook server with web interface"
url="https://github.com/7h0ma5/CloudShack"
arch=("i686" "x86_64")
license=(GPL3)
depends=()
mkdepends=(nodejs elixir)
provides=(cloudshack)
conflicts=(cloudshack)
source=(cloudshack.service cloudshack.sysusers cloudshack.tmpfiles)
sha256sums=('0fcda8ffa8c8eb550743dcce9da8cc6118acfbfa7fc01dd22116fb48dcaa5457'
            '7a40cb85ab39e35fa9c67cadeea024c316ecc24548db8f87d024778df6098241'
            'c3f685535e59b966fb76a0aace65a998ff065d9727253ba346761d384b9e0990')

_gitroot="git://github.com/7h0ma5/cloudshack.git"
_gitname="cloudshack-git"

build() {
  cd "${srcdir}"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive $_gitroot $_gitname
  fi

  cd "${srcdir}/${pkgname}/webapp"
  npm install
  npm run build

  cd "${srcdir}/${pkgname}/"
  export MIX_ENV=prod

  mix local.hex --force
  mix local.rebar --force
  mix deps.get
  mix compile
  mix release
}

package() {
  install -dm755 ${pkgdir}/usr/lib

  cd "${srcdir}/${pkgname}/_build/prod/rel/cloudshack"
  rm -f releases/*/cloudshack.tar.gz
  chmod 755 bin/{cloudshack,nodetool}
  chmod 755 releases/*/cloudshack.sh

  cp -r ${srcdir}/${pkgname}/_build/prod/rel/cloudshack/ ${pkgdir}/usr/lib

  cd "${srcdir}"
  install -Dm644 cloudshack.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 cloudshack.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/cloudshack.conf
  install -Dm644 cloudshack.sysusers "${pkgdir}"/usr/lib/sysusers.d/cloudshack.conf
}
