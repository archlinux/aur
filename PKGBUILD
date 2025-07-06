# Maintainer: Mark Collins <tera_1225 hatt hotmail.com>
pkgname=borgwarehouse
pkgver=3.1.1
pkgrel=1
pkgdesc="WebUI for a BorgBackup central repository server"
arch=("x86_64")
url="https://github.com/ravinou/borgwarehouse"
license=('AGPL-3.0-or-later')
depends=(
  'bash'
  'borgbackup'
  'curl'
  'gcc-libs'
  'glibc'
  'jq'
  'nodejs'
  'python'
)
optdepends=(
  'apprise' # apprise notifications from borgwarehouse
)
makedepends=(
  'fd'
  'npm'
)
backup=(
  "etc/webapps/${pkgname}/${pkgname}.env"
  "etc/webapps/${pkgname}/config/repo.json"
  "etc/webapps/${pkgname}/config/users.json"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}-cron.service"
        "${pkgname}-cron.timer"
        "sysusers-${pkgname}.conf"
        "${pkgname}.tmpfiles"
        "fix-env-nodocker.patch")
sha256sums=('b42d664064a15f3dd95d8f6c8fe4dd20cf900873f17a470c74ea4877bc88c569'
            '4e5b300b524cd43fb6ad823168375c0d1893e993d5e60a6724dac70272d3e308'
            '6753277459e56e7bf3ed168e03ecbc29a24c58dd64dde946d43fed93c5363c6d'
            '5668cbdd26b701514a89ff17175bcc058bfdb0ac0b5c665cf2d8b555179c5446'
            '3f22c300895bff34b8da9719d378e5d11b232bd0143fee8ed6132186652f3dcd'
            'd4f56d93028a838ebc60aa7a763d63ef1d4efeb4260fcc93216548541159b2e9'
            '4b4178d54516a5f727ab2afc534e2a7f5fd5270a50ba378a11a12674b9e80f9e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "Patching environment file"
  patch --forward --strip=1 --input=../fix-env-nodocker.patch
  echo "Fixing home directory in scripts"
  sed -i 's#/home/borgwarehouse#/var/lib/borgwarehouse#g' ./helpers/shells/*
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "Building"
  npm clean-install
  npm audit fix # currently there is https://security.snyk.io/vuln/SNYK-JS-BRACES-6838727
  npm run build
  npm prune --production
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  echo "Cleaning up source dir"  
  rm -R docker tests
  rm .prettierrc.json .pre-commit-config.yaml
  fd --threads 1 --no-ignore --hidden 'docker' -x rm -R 
  fd --threads 1 --no-ignore --hidden '.git' -x rm -R
  
  echo "Applying correct permissions"
  fd --no-ignore --hidden --type d '.*' "./" -x chmod 755
  fd --no-ignore --hidden --type f '.*\.sh$' "./helpers/shells/" -x chmod 755
  
  echo "Packaging main app folder"
  install -dm 755 "${pkgdir}/usr/share/webapps/"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -dm 755 "${pkgdir}/etc/webapps/$pkgname"
  mv "${pkgdir}/usr/share/webapps/${pkgname}/.env.sample" "${pkgdir}/etc/webapps/${pkgname}/${pkgname}.env"
  ln -s "/etc/webapps/${pkgname}/${pkgname}.env" "${pkgdir}/usr/share/webapps/${pkgname}/.env"
  mv "${pkgdir}/usr/share/webapps/${pkgname}/config" "${pkgdir}/etc/webapps/${pkgname}/"
  ln -s "/etc/webapps/${pkgname}/config" "${pkgdir}/usr/share/webapps/${pkgname}/config"
  touch "${pkgdir}/etc/webapps/${pkgname}/config/repo.json"
  touch "${pkgdir}/etc/webapps/${pkgname}/config/users.json"
  install -Dm644 "${srcdir}/sysusers-${pkgname}.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-cron.service" "$pkgdir/usr/lib/systemd/system/${pkgname}-cron.service"
  install -Dm644 "${srcdir}/${pkgname}-cron.timer" "$pkgdir/usr/lib/systemd/system/${pkgname}-cron.timer"

  echo "Removing references to pkgdir"
  fd --no-ignore --hidden --type f 'package.json' "$pkgdir" -x sed -i "/_where/d"
  
  echo "Removing references to srcdir"
  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/share/webapps/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
  fd --no-ignore --hidden --type f 'package.json' "$pkgdir" | while read -r pkgjson; do
    local tmppackage="$(mktemp)"
    jq 'del(.man)' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
  done

}

