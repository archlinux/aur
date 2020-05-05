# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

# FIXME
# - Fix symlink server.cfg, /var/lib/quakejs

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
	'quakejs.service'
	'quakejs.sysusers'
	'quakejs.tmpfiles'
	'quakejs.conf')
sha512sums=('SKIP'
            'f9fc1684e9a2e3f992a59dad204b9deea8a9878953ff9b80dd1fb0ffde9f1d12efdb462a87b3c94b7fcfdef630911eddf5743ec7c7df445e6749cc7d163ce86a'
            '41ce94ad41123ae4892089f82569b480af926702b482707f96728eb4fe6f50b69e84827f80c3014eab343f756f2fba5a0c2e6b7720f094e04bef6009589005da'
            '3aea5a5622808e89525d9e1cb16798046b8273dee961132186c109ea12d72b08c10897a0e98add976f807100b3b76a4f30a46153d01278987e8f54d151c98982'
            '58779c6ed13a63dbedffac3bf6dfdc3ee73ba909e868e1e4201762ea58f898f23eb4a887e1444273899c49a6eb7ae5e32ae04b1099d2d728d6c3e2adaee09372'
            '84fb1316159b31068efa9917ad77935087e69b522aed460e9a1c9f394ebba93e3c1385aad0740a01931d10172512a9aa9f28905cd9d0924e5e64f9bf58d4ec3d'
            'a7cc7ec2d2cfda5d5b71490b9f2b06fb859bca6a77216a35b536caa09a4e523a7e976339a2f75b0d38ea70e17dd1f5bec3f30fc51fadca9c474f90dbdc7b60d2'
            'a8bb1786b7c950b4e8773eb9dd98659f287177b65c76ba58b25980d765234b30995da75b6c98bad97541941a56abdd4371dfaa9f0d8e9f9e9f1b45c2954edc29'
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
  install -d "${pkgdir}/usr/share/webapps/quakejs/assets"
  #install -d "${pkgdir}/var/lib/quakejs"
  #ln -s "/var/lib/quakejs" "${pkgdir}/usr/share/webapps/quakejs/base"
  cp -ra "${srcdir}/quakejs/." "${pkgdir}/usr/share/webapps/quakejs/"
  for f in ".git" ".gitignore" ".gitmodules" "package.json" "package-lock.json"; do
    rm -rf "${pkgdir}/usr/share/webapps/quakejs/${f}"
  done

  cp "${srcdir}/server.cfg" "${srcdir}/web.json" "${pkgdir}/etc/webapps/quakejs"
  #ln -s "/etc/webapps/quakejs/server.cfg" "${pkgdir}/var/lib/quakejs/base/baseq3/server.cfg" 
  #ln -s "/etc/webapps/quakejs/server.cfg" "${pkgdir}/usr/share/webapps/quakejs/base/baseq3/server.cfg" 
  install -Dm 644 "${srcdir}/server.cfg" "${pkgdir}/usr/share/webapps/quakejs/base/baseq3/server.cfg" 
  install -Dm 644 "${srcdir}/quakejs.conf" "${pkgdir}/etc/conf.d/quakejs"

  install -Dm 644 "${srcdir}/quakejs-cdn.service" "${pkgdir}/usr/lib/systemd/system/quakejs-cdn.service"
  install -Dm 644 "${srcdir}/quakejs-ds.service" "${pkgdir}/usr/lib/systemd/system/quakejs-ds.service"
  install -Dm 644 "${srcdir}/quakejs.service" "${pkgdir}/usr/lib/systemd/system/quakejs.service"
  install -Dm 644 "${srcdir}/quakejs.sysusers" "${pkgdir}/usr/lib/sysusers.d/quakejs.conf"
  install -Dm 644 "${srcdir}/quakejs.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/quakejs.conf"
}
