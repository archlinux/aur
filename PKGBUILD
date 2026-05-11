# Maintainer: Mark Collins <tera_1225 hatt hotmail.com>
pkgname=borgwarehouse
pkgver=3.1.4
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
  'pnpm'
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
        "fix-env-nodocker.patch")
sha256sums=('2e91af0c7a1a27c3751222e20d1a956e92c33a130ca95c55e534d98104d90ef1'
            '1dc90e5aecd5f00dc52e877b152a42bd2d66e9814b1718d5456af8898286bc7f'
            'ce1a55c203eef3c65f186efc3ffa2bcf416de67e5586cf542edf199b8a9ec47a'
            '15bc6db13bfa17402ee07bb2f91711a0d84d298b3fbd3f48722345d4c19bb917'
            'ab3e40452498b965180109b560d352646c6dcc048675b5fd2b371f6632f6a827')

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
  pnpm install --frozen-lockfile --pro
  pnpm run build
  pnpm prune --prod
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  echo "Cleaning up source dir"  
  rm -R .husky Containers docker tests 
  rm .commitlintrc.mjs .dockerignore .npmrc .prettierrc.json .pre-commit-config.yaml Dockerfile docker-compose.yml eslint.config.mjs pnpm-lock.yaml pnpm-workspace.yaml vitest.config.ts 
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

