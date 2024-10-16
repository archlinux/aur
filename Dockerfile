FROM greyltc/archlinux-aur

RUN aur-install dogelog-node

ENTRYPOINT ["node", "/usr/share/dogelog/dogelog.mjs"]
