FROM greyltc/archlinux-aur AS construction-site

RUN aur-install dogelog-node

FROM archlinux:base
COPY --from=construction-site /var/cache/foreign-pkg/*.pkg.* /tmp
RUN <<EOT
    pacman -Sy --noconfirm &&
    pacman -U --noconfirm /tmp/*.pkg.* &&
    rm /tmp/*.pkg.*
EOT

ENTRYPOINT ["node", "/usr/share/dogelog/dogelog.mjs"]
