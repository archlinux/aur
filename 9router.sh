#!/bin/bash
# 9Router WebUI Launcher - Interactive first-run setup

# Set up directories
export DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/9router"
export CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/9router"
mkdir -p "$DATA_DIR" "$CONFIG_DIR"

ENV_FILE="$CONFIG_DIR/.env"
PORT=${PORT:-20128}

# Interactive setup on first run
if [ ! -f "$ENV_FILE" ]; then
    echo "🔧 First run: Setting up 9Router configuration..."
    echo ""
    echo "📋 Please answer the following questions:"
    echo ""

    read -p "▶️  Enter port for 9Router [default: 20128]: " input_port
    PORT=${input_port:-20128}

    echo ""
    echo "🔑 Free AI providers available without API keys:"
    echo "   - Kiro AI (free, limited requests)"
    echo "   - OpenCode Free (free, limited requests)"
    echo "   - Gemini Free (limited, requires Google account)"
    echo ""
    read -p "▶️  Do you want to enable free providers? (y/n) [default: y]: " enable_free
    ENABLE_FREE=${enable_free:-y}

    echo ""
    echo "🔐 If you have API keys for paid services, you can add them later."
    echo "   Supported: OpenAI, Anthropic, Google, DeepSeek, Groq, Cohere, and more."
    echo ""
    read -p "▶️  Continue with setup? (y/n) [default: y]: " continue_setup
    CONTINUE_SETUP=${continue_setup:-y}

    if [[ "$CONTINUE_SETUP" =~ ^[Yy]$ ]]; then
        cat > "$ENV_FILE" <<EOL
# 9Router Configuration
# Generated on $(date)

PORT=$PORT
NODE_ENV=production
DATA_DIR=$DATA_DIR
NEXT_PUBLIC_BASE_URL=http://localhost:$PORT
OPEN_KIRO_AI=${ENABLE_FREE,,}
OPEN_OPECODE_FREE=${ENABLE_FREE,,}

# Add your API keys below:
# OPENAI_API_KEY=sk-...
# ANTHROPIC_API_KEY=sk-...
# GOOGLE_API_KEY=...
# GROQ_API_KEY=...
# DEEPSEEK_API_KEY=...
EOL
        echo ""
        echo "✅ Configuration saved to: $ENV_FILE"
        echo ""
        echo "💡 You can edit this file later to add API keys:"
        echo "   $EDITOR $ENV_FILE"
    else
        echo "⚠️  Setup cancelled. Run '9router' again to complete setup."
        exit 1
    fi
fi

# Load configuration
if [ -f "$ENV_FILE" ]; then
    set -a
    source "$ENV_FILE"
    set +a
fi

export PORT=${PORT:-20128}
export DATA_DIR=${DATA_DIR:-$HOME/.local/share/9router}

# Check if using systemd service
if [[ "$1" == "--service" ]]; then
    exec /usr/bin/bun /usr/lib/node_modules/9router/cli.js --skip-update
else
    # Regular launch - start server and open browser
    echo "🚀 Starting 9Router on port $PORT..."

    # Check if already running
    if curl -s "http://localhost:$PORT/api/health" > /dev/null 2>&1; then
        echo "✅ 9Router is already running on port $PORT"
        notify-send -i network-server "9Router" "Already running on port $PORT" 2>/dev/null || true
    else
        # Start server in background
        nohup /usr/bin/bun /usr/lib/node_modules/9router/cli.js --skip-update > /tmp/9router.log 2>&1 &
        SERVER_PID=$!

        # Wait for server to be ready
        echo "⏳ Waiting for server to start..."
        timeout=30
        while ! curl -s "http://localhost:$PORT/api/health" > /dev/null 2>&1; do
            sleep 0.5
            timeout=$((timeout - 1))
            if [ $timeout -le 0 ]; then
                echo "❌ Server failed to start. Check /tmp/9router.log"
                exit 1
            fi
        done
        echo "✅ Server ready!"
        notify-send -i network-server "9Router" "Server started on port $PORT" 2>/dev/null || true
    fi

    # Open dashboard
    echo "🌐 Opening WebUI: http://localhost:$PORT/dashboard"
    if command -v xdg-open > /dev/null; then
        xdg-open "http://localhost:$PORT/dashboard"
    else
        echo "   Open your browser and go to: http://localhost:$PORT/dashboard"
    fi

    echo ""
    echo "📊 Dashboard:  http://localhost:$PORT/dashboard"
    echo "🔗 API:        http://localhost:$PORT/v1"
    echo "📄 Logs:       /tmp/9router.log"
    echo ""
    echo "💡 Commands:"
    echo "   systemctl --user start 9router.service  (start as background service)"
    echo "   systemctl --user status 9router.service (check service status)"
    echo "   9router stop                            (stop the service)"
fi
