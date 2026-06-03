# Headphone Jack Auto-Switch

不在本包打包范围。说明现状,以及想要自动切换的人可以自己 ship 的脚本。

## 现状

PX13 kernel jack detection 由本包 DKMS 的 0017 patch(rt721-sdca,AMD ACP70 jack-detect IRQ)提供:插拔耳机 `Headphone Jack` / `Headset Mic Jack` 两个 ALSA kctl 正确翻转 `false` ↔ `true`。验证方法:

```bash
alsactl store -f /tmp/c1 1 && grep -A1 'Headphone Jack' /tmp/c1
# value 应该跟插/拔状态对应
```

但 PipeWire / WirePlumber 不会自动把默认 sink 在 `__Speaker__sink` 和 `__Headphones__sink` 之间切换。这是 sof-soundwire UCM 的架构产物:每个 `SectionDevice` 各成独立 sink、每个 sink 只有一个 port,跟 PipeWire 标准 "一卡多 port + JackControl 翻转 active port" 模型对不上。

`pactl list sinks` 会显示两个 sink 的 port `availability unknown`,这是预期。

## 上游进展

| Issue | 状态 | 链接 |
|---|---|---|
| PipeWire #5191 — Lenovo T14s G7 同症状 | OPEN | https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/5191 |
| alsa-ucm-conf #726 — 维护者明确说是 PipeWire 的事 | CLOSED(转交) | https://github.com/alsa-project/alsa-ucm-conf/issues/726 |
| thesofproject/linux #5588 — sof-soundwire jack events | OPEN | https://github.com/thesofproject/linux/issues/5588 |
| cryptob1's PX13 status gist | "Manual sink switch needed" | https://gist.github.com/cryptob1/f62aaf8517df2e540f447347f42c7a03 |

没有上游 patch 在 review。也不是 ASUS 独家问题,Intel SDW 笔记本同样架构,只是没 PX13 这边明显。

## 想要自动切换的用户:用户态 hook 示例

不打包,因为这属于 userspace policy,不是硬件 quirk。想用的人复制下面两个文件到自己的 `~/.config/`,`systemctl --user enable --now px13-jack-watch.service`。

### `~/.local/bin/px13-jack-watch.sh`

```bash
#!/usr/bin/env bash
# Watch ALSA Headphone Jack kctl, flip PipeWire default sink accordingly.
set -euo pipefail

CARD_NAME=${CARD_NAME:-amdsoundwire}
CARD=$(awk -v n="$CARD_NAME" 'match($0,/\[ *([^ ]+) *\]/,m){if(m[1]==n)print $1+0; exit}' /proc/asound/cards)
[[ -n $CARD ]] || { echo "card $CARD_NAME not found" >&2; exit 1; }

get_jack () {
    local state out
    state=$(mktemp); trap "rm -f $state" RETURN
    alsactl store -f "$state" "$CARD" 2>/dev/null || return
    awk -v J="$1" '$0 ~ "name '\''" J "'\''" { getline; if ($1=="value") { print $2; exit } }' "$state"
}

sink_id_matching () {
    wpctl status | awk -v re="$1" '
        /Sinks:/ { in_sinks=1; next }
        /Sources:/ { in_sinks=0 }
        in_sinks && $0 ~ re { for (i=1;i<=NF;i++) if ($i ~ /^[0-9]+\.$/) { gsub(/\./,"",$i); print $i; exit } }'
}

apply () {
    local target
    if [[ "$(get_jack 'Headphone Jack')" == "true" ]]; then
        target=$(sink_id_matching 'Headphones')
    else
        target=$(sink_id_matching 'Speaker')
    fi
    [[ -n $target ]] && wpctl set-default "$target" 2>/dev/null || true
}

apply
exec stdbuf -oL alsactl monitor "hw:$CARD" | while read -r _; do apply; done
```

`chmod +x ~/.local/bin/px13-jack-watch.sh`。

### `~/.config/systemd/user/px13-jack-watch.service`

```ini
[Unit]
Description=PX13 jack-driven default-sink switcher
After=wireplumber.service pipewire.service
PartOf=wireplumber.service

[Service]
Type=simple
ExecStart=%h/.local/bin/px13-jack-watch.sh
Restart=on-failure
RestartSec=2

[Install]
WantedBy=default.target
```

启用:`systemctl --user daemon-reload && systemctl --user enable --now px13-jack-watch.service`。

## 为什么不打包这个

- 是 PipeWire 上游 bug 的 userspace workaround,不是硬件 quirk
- 用户的 routing 偏好不同:有人喜欢插耳机不切,我们硬切会冒犯
- 跨用户行为耦合(`systemctl --global enable` 给所有 user 自启)
- 维护成本:`wpctl status` 输出格式跟 WirePlumber 版本绑,易碎
- AUR 硬件 quirks 包不建议带 daemon

打包**仅**修硬件层(本包 DKMS 的 0017 + UCM)。WP 自动切换由 dotfiles / 上游 PipeWire / 桌面环境负责。
