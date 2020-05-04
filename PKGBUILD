# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=quakejs-git
pkgver=20190325.977b188
pkgrel=1
pkgdesc="Port of ioquake3 to JavaScript with the help of Emscripten"
arch=('any')
url="https://github.com/inolen/quakejs"
license=('unknown')
depends=('nodejs')
makedepends=('npm')
options=('!strip')
source=('git+https://github.com/inolen/quakejs.git'
	'server.cfg'
	'web.json'
	'quakejs-cdn.service'
	'quakejs-ds.service'
	'quakejs.sysusers'
	'quakejs.tmpfiles'
	'quakejs.conf')
sha512sums=('SKIP'
            'f9fc1684e9a2e3f992a59dad204b9deea8a9878953ff9b80dd1fb0ffde9f1d12efdb462a87b3c94b7fcfdef630911eddf5743ec7c7df445e6749cc7d163ce86a'
            '41ce94ad41123ae4892089f82569b480af926702b482707f96728eb4fe6f50b69e84827f80c3014eab343f756f2fba5a0c2e6b7720f094e04bef6009589005da'
            'f81701ed3d1d941383c2b88d189b5081efa4b8815a952264db74e4e51d01e7d4beddc48e75fbb0fdcb98d029a8a749862963e47a263d61141085ea3bddf6a587'
            '637987ce4b0a3f015a3545d2a49ec3fe11ed39a49cf3ade8531253b8306330d50856a580a314901dd89ffea498d278887d95c21126e22f56527e45f884b3f3f7'
            'a7cc7ec2d2cfda5d5b71490b9f2b06fb859bca6a77216a35b536caa09a4e523a7e976339a2f75b0d38ea70e17dd1f5bec3f30fc51fadca9c474f90dbdc7b60d2'
            'd655bc35d95e8723c068519dc24599f56f58ce0c8017d5180e5e36569aef9ae7af8b0f8bdb9f893de61b3237a5aca00ada6a73a69f0ffde75df7aec1b2b14b14'
            '23f17d280914795bf3f6ab4b7d1db910ffc09cdb4fea22ff6c6ab4a423750a62388b174ed6abaef3662908102e9b79ec351282c52ad2e4c9b27baba5dbcbc4fa')
backup=('etc/webapps/quakejs/server.cfg'
	'etc/webapps/quakejs/web.json'
	'etc/conf.d/quakejs')
install="quakejs.install"

pkgver() {
  cd "${srcdir}/quakejs"
  git log -1 --format=%cd.%h --date=short | tr -d -
}
 
build() {
  cd "${srcdir}/quakejs"
  git submodule update --init
  npm install --cache "${srcdir}/npm-cache"
}

package() {
  install -d "${pkgdir}/etc/webapps/quakejs"
  install -d "${pkgdir}/usr/share/webapps/quakejs"
  #install -d "${pkgdir}/var/lib/quakejs"
  #ln -s "/var/lib/quakejs" "${pkgdir}/usr/share/webapps/quakejs/base"
  cp -ra "${srcdir}/quakejs/." "${pkgdir}/usr/share/webapps/quakejs/"
  for f in ".git" ".gitignore" ".gitmodules" "package.json" "package-lock.json"; do
    rm -rf "${pkgdir}/usr/share/webapps/quakejs/${f}"
  done

  #cp "${srcdir}/server.cfg" "${srcdir}/web.json" "${pkgdir}/etc/webapps/quakejs"
  #ln -s "/etc/webapps/quakejs/server.cfg" "${pkgdir}/var/lib/quakejs/base/baseq3/server.cfg" 
  #ln -s "/etc/webapps/quakejs/server.cfg" "${pkgdir}/usr/share/webapps/quakejs/base/baseq3/server.cfg" 
  install -Dm 644 "${srcdir}/server.cfg" "${pkgdir}/usr/share/webapps/quakejs/base/baseq3/server.cfg" 
  install -Dm 644 "${srcdir}/quakejs.conf" "${pkgdir}/etc/conf.d/quakejs"
  ln -s "/etc/webapps/quakejs/web.json" "${pkgdir}/usr/share/webapps/quakejs/web.json"

  install -Dm 644 "${srcdir}/quakejs-cdn.service" "${pkgdir}/usr/lib/systemd/system/quakejs-cdn.service"
  install -Dm 644 "${srcdir}/quakejs-ds.service" "${pkgdir}/usr/lib/systemd/system/quakejs-ds.service"
  install -Dm 644 "${srcdir}/quakejs.sysusers" "${pkgdir}/usr/lib/sysusers.d/quakejs.conf"
  install -Dm 644 "${srcdir}/quakejs.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/quakejs.conf"
}
