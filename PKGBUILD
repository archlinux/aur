# Maintainer: Udi Oron <udioron@gmail.com>
pkgname=pgcli-zsh-completion
pkgver=4.5.0
pkgrel=1
pkgdesc='Zsh completion for pgcli'
arch=('any')
url='https://github.com/nonZero/pgcli-zsh-completion'
license=('0BSD')
# Tied to the matching pgcli release: the option list is baked from this exact
# version, so the two must be upgraded together.
depends=('zsh' 'postgresql' "pgcli=${pkgver}")

build() {
  cd "$srcdir"

  # --- Parser: Click emits 3 lines per item (type, value, help). Keep the
  #     "plain" options and turn them into escaped `value:desc` _describe entries.
  cat > parse-opts.awk <<'AWK'
NR % 3 == 1 { t = $0; next }
NR % 3 == 2 { v = $0; next }
NR % 3 == 0 {
  h = $0
  if (t != "plain") next
  if (h == "_") h = ""
  gsub(/\\/, "\\\\", h)        # escape backslashes
  gsub(/'/,  "'\\''", h)       # escape single quotes for zsh
  gsub(/:/,  "\\:",  h)        # ':' is the _describe value/desc separator
  printf "  '%s:%s'\n", v, h
}
AWK

  # --- Run Click's completion machinery against THIS pgcli to harvest options.
  local opts
  opts="$(COMP_WORDS='pgcli -' COMP_CWORD=1 _PGCLI_COMPLETE=zsh_complete pgcli 2>/dev/null \
          | awk -f parse-opts.awk)"

  if [[ -z $opts ]]; then
    echo 'ERROR: harvested no options from pgcli completer (Click protocol changed?)' >&2
    return 1
  fi

  # --- Assemble the static completion file: baked options + cached psql values.
  cat > _pgcli <<'HEADER'
#compdef pgcli
# AUTO-GENERATED at package build from pgcli @PKGVER@ -- do not edit by hand.

_pgcli_databases() {
  local -a dbs
  dbs=(${(f)"$(psql -AtqXwc 'SELECT datname FROM pg_database WHERE NOT datistemplate' template1 2>/dev/null)"})
  _wanted databases expl 'database' compadd -a dbs
}

_pgcli_users() {
  local -a users
  users=(${(f)"$(psql -AtqXwc 'SELECT rolname FROM pg_roles' template1 2>/dev/null)"})
  _wanted users expl 'role' compadd -a users
}

local -a opts
opts=(
HEADER

  printf '%s\n' "$opts" >> _pgcli

  cat >> _pgcli <<'FOOTER'
)

# Inject db/role/host/file completion for the value-taking connection options;
# everything else falls back to the baked option list.
local prev=${words[CURRENT-1]}
case $prev in
  -d|--dbname)                                _pgcli_databases; return ;;
  -U|--username|-u|--user)                    _pgcli_users;     return ;;
  -h|--host|--ssh-tunnel)                     _hosts;           return ;;
  -f|--file|-o|--output|--log-file|--pgclirc) _files;           return ;;
esac

if [[ ${words[CURRENT]} == -* ]]; then
  _describe -t options 'pgcli option' opts
else
  _pgcli_databases
  _describe -t options 'pgcli option' opts
fi
FOOTER

  sed -i "s/@PKGVER@/${pkgver}/g" _pgcli
}

package() {
  install -Dm644 "$srcdir/_pgcli" "$pkgdir/usr/share/zsh/site-functions/_pgcli"
}
