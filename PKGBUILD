# Maintainer: Mark Collins <tera_1225 hatt hotmail.com>
pkgname=borgwarehouse
pkgver=3.1.2
pkgrel=2
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
sha256sums=('d1bb2cbd1ecdfebefb3f32149eb78de16a001594a2d154fbc5ae50b0a8c4c0d2'
            '4e5b300b524cd43fb6ad823168375c0d1893e993d5e60a6724dac70272d3e308'
            '26faf461d271087338f99adeeef1f206edb37f57fd4bd700d5af906352a238b5'
            '15bc6db13bfa17402ee07bb2f91711a0d84d298b3fbd3f48722345d4c19bb917'
            '3f22c300895bff34b8da9719d378e5d11b232bd0143fee8ed6132186652f3dcd'
            '82978ae331edbd8bd9df65dc5d4797c36199edb25b3db469d8dbb26afae81a7c'
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
  rm -R .husky docker tests 
  rm .commitlintrc.mjs .dockerignore .prettierrc.json .pre-commit-config.yaml Dockerfile docker-compose.yml eslint.config.mjs vitest.config.ts 
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

