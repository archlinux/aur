[private]
@default:
  just --list

sha256sum version:
  sha256sum which-key-wayland-{{version}}.tar.gz | awk '{print $1}'

clean:
  rm -rdf *.log *.tar.{gz,zst} pkg src

# vim: set ts=2 sw=2 sts=2 et:
